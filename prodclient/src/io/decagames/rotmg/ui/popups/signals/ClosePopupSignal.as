﻿//io.decagames.rotmg.ui.popups.signals.ClosePopupSignal

package io.decagames.rotmg.ui.popups.signals
{
    import org.osflash.signals.Signal;
    import io.decagames.rotmg.ui.popups.BasePopup;

    public class ClosePopupSignal extends Signal 
    {

        public function ClosePopupSignal()
        {
            super(BasePopup);
        }

    }
}//package io.decagames.rotmg.ui.popups.signals

