// Decompiled by AS3 Sorcerer 6.78
// www.buraks.com/as3sorcerer

//kabam.rotmg.game.commands.TextPanelMessageUpdateCommand

package kabam.rotmg.game.commands
{
    import robotlegs.bender.bundles.mvcs.Command;
    import kabam.rotmg.game.model.TextPanelData;

    public class TextPanelMessageUpdateCommand extends Command 
    {

        [Inject]
        public var model:TextPanelData;
        [Inject]
        public var message:String;


        override public function execute():void
        {
            this.model.message = this.message;
        }


    }
}//package kabam.rotmg.game.commands

