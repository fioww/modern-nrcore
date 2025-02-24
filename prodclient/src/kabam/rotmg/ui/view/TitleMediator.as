﻿//kabam.rotmg.ui.view.TitleMediator

package kabam.rotmg.ui.view
{
    import robotlegs.bender.bundles.mvcs.Mediator;
    import kabam.rotmg.account.core.Account;
    import kabam.rotmg.core.model.PlayerModel;
    import kabam.rotmg.core.signals.SetScreenSignal;
    import kabam.rotmg.core.signals.SetScreenWithValidDataSignal;
    import kabam.rotmg.ui.signals.EnterGameSignal;
    import kabam.rotmg.account.core.signals.OpenAccountInfoSignal;
    import kabam.rotmg.dialogs.control.OpenDialogSignal;
    import kabam.rotmg.application.api.ApplicationSetup;
    import kabam.rotmg.core.view.Layers;
    import kabam.rotmg.account.securityQuestions.data.SecurityQuestionsModel;
    import robotlegs.bender.framework.api.ILogger;
    import kabam.rotmg.appengine.api.AppEngineClient;
    import kabam.rotmg.build.api.BuildData;
    import kabam.rotmg.account.securityQuestions.view.SecurityQuestionsInfoDialog;
    import com.company.assembleegameclient.parameters.Parameters;
    import flash.net.URLRequest;
    import flash.net.navigateToURL;
    import flash.net.URLVariables;
    import kabam.rotmg.application.DynamicSettings;
    import flash.net.URLRequestMethod;
    import flash.system.Capabilities;
    import flash.external.ExternalInterface;
    import kabam.rotmg.ui.model.EnvironmentData;
    import kabam.rotmg.legends.view.LegendsView;
    import flash.events.Event;

import shared.realmeditor.EditorLoader;

public class TitleMediator extends Mediator
    {

        private static var supportCalledBefore:Boolean = false;

        [Inject]
        public var view:TitleView;
        [Inject]
        public var account:Account;
        [Inject]
        public var playerModel:PlayerModel;
        [Inject]
        public var setScreen:SetScreenSignal;
        [Inject]
        public var setScreenWithValidData:SetScreenWithValidDataSignal;
        [Inject]
        public var enterGame:EnterGameSignal;
        [Inject]
        public var openAccountInfo:OpenAccountInfoSignal;
        [Inject]
        public var openDialog:OpenDialogSignal;
        [Inject]
        public var setup:ApplicationSetup;
        [Inject]
        public var layers:Layers;
        [Inject]
        public var securityQuestionsModel:SecurityQuestionsModel;
        [Inject]
        public var logger:ILogger;
        [Inject]
        public var client:AppEngineClient;
        [Inject]
        public var buildData:BuildData;


        override public function initialize():void
        {
            this.view.optionalButtonsAdded.add(this.onOptionalButtonsAdded);
            this.view.initialize(this.makeEnvironmentData());
            this.view.playClicked.add(this.handleIntentionToPlay);
            this.view.accountClicked.add(this.handleIntentionToReviewAccount);
            this.view.legendsClicked.add(this.showLegendsScreen);
            this.view.supportClicked.add(this.openSupportPage);
            if (this.playerModel.isNewToEditing())
            {
                this.view.putNoticeTagToOption(this.view.buttonFactory.getEditorButton(), "new");
            };
            if (this.securityQuestionsModel.showSecurityQuestionsOnStartup)
            {
                this.openDialog.dispatch(new SecurityQuestionsInfoDialog());
            };
            if (!Parameters.sessionStarted)
            {
                Parameters.sessionStarted = true;
            };
        }

        private function openSupportPage():void
        {
            var _local_1:URLRequest = new URLRequest();
            _local_1.url = "https://support.decagames.com";
            navigateToURL(_local_1, "_blank");
        }

        private function onSupportVerifyComplete(_arg_1:Boolean, _arg_2:*):void
        {
            var _local_3:XML;
            if (_arg_1)
            {
                _local_3 = new XML(_arg_2);
                if (((_local_3.hasOwnProperty("mp")) && (_local_3.hasOwnProperty("sg"))))
                {
                    this.toSupportPage(_local_3.mp, _local_3.sg);
                };
            };
        }

        private function toSupportPage(_arg_1:String, _arg_2:String):void
        {
            var _local_3:URLVariables = new URLVariables();
            var _local_4:URLRequest = new URLRequest();
            var _local_5:Boolean;
            _local_3.mp = _arg_1;
            _local_3.sg = _arg_2;
            if (((DynamicSettings.settingExists("SalesforceMobile")) && (DynamicSettings.getSettingValue("SalesforceMobile") == 1)))
            {
                _local_5 = true;
            };
            var _local_6:String = this.playerModel.getSalesForceData();
            if (((_local_6 == "unavailable") || (!(_local_5))))
            {
                _local_4.url = "https://decagames.desk.com/customer/authentication/multipass/callback";
                _local_4.method = URLRequestMethod.GET;
                _local_4.data = _local_3;
                navigateToURL(_local_4, "_blank");
            }
            else
            {
                if (((Capabilities.playerType == "PlugIn") || (Capabilities.playerType == "ActiveX")))
                {
                    if (!supportCalledBefore)
                    {
                        ExternalInterface.call("openSalesForceFirstTime", _local_6);
                        supportCalledBefore = true;
                    }
                    else
                    {
                        ExternalInterface.call("reopenSalesForce");
                    };
                }
                else
                {
                    _local_3.data = _local_6;
                    _local_4.url = "https://decagames.desk.com/customer/authentication/multipass/callback";
                    _local_4.method = URLRequestMethod.GET;
                    _local_4.data = _local_3;
                    navigateToURL(_local_4, "_blank");
                };
            };
        }

        private function onOptionalButtonsAdded():void
        {
            ((this.view.editorClicked) && (this.view.editorClicked.add(this.showMapEditor)));
            ((this.view.quitClicked) && (this.view.quitClicked.add(this.attemptToCloseClient)));
        }

        private function makeEnvironmentData():EnvironmentData
        {
            var _local_1:EnvironmentData = new EnvironmentData();
            _local_1.isDesktop = (Capabilities.playerType == "Desktop");
            _local_1.canMapEdit = ((this.playerModel.isAdmin()) || (this.playerModel.mapEditor()));
            _local_1.buildLabel = this.setup.getBuildLabel();
            return (_local_1);
        }

        override public function destroy():void
        {
            this.view.playClicked.remove(this.handleIntentionToPlay);
            this.view.accountClicked.remove(this.handleIntentionToReviewAccount);
            this.view.legendsClicked.remove(this.showLegendsScreen);
            this.view.supportClicked.remove(this.openSupportPage);
            this.view.optionalButtonsAdded.remove(this.onOptionalButtonsAdded);
            ((this.view.editorClicked) && (this.view.editorClicked.remove(this.showMapEditor)));
            ((this.view.quitClicked) && (this.view.quitClicked.remove(this.attemptToCloseClient)));
        }

        private function handleIntentionToPlay():void
        {
            if (this.account.isRegistered())
            {
                this.enterGame.dispatch();
            }
            else
            {
                this.openAccountInfo.dispatch(false);
            };
        }

        private function handleIntentionToReviewAccount():void
        {
            this.openAccountInfo.dispatch(false);
        }

        private function showLegendsScreen():void
        {
            this.setScreen.dispatch(new LegendsView());
        }

        private function showMapEditor():void
        {
            this.setScreen.dispatch(EditorLoader.load(this.view));
        }

        private function attemptToCloseClient():void
        {
            dispatch(new Event("APP_CLOSE_EVENT"));
        }


    }
}//package kabam.rotmg.ui.view

