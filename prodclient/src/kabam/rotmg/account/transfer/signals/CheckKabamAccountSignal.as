﻿// Decompiled by AS3 Sorcerer 6.78
// www.buraks.com/as3sorcerer

//kabam.rotmg.account.transfer.signals.CheckKabamAccountSignal

package kabam.rotmg.account.transfer.signals
{
    import org.osflash.signals.Signal;
    import kabam.rotmg.account.transfer.model.TransferAccountData;

    public class CheckKabamAccountSignal extends Signal 
    {

        public function CheckKabamAccountSignal()
        {
            super(TransferAccountData);
        }

    }
}//package kabam.rotmg.account.transfer.signals

