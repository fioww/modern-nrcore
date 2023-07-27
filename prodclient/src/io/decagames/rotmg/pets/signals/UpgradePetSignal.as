// Decompiled by AS3 Sorcerer 6.78
// www.buraks.com/as3sorcerer

//io.decagames.rotmg.pets.signals.UpgradePetSignal

package io.decagames.rotmg.pets.signals
{
    import org.osflash.signals.Signal;
    import io.decagames.rotmg.pets.data.vo.requests.IUpgradePetRequestVO;

    public class UpgradePetSignal extends Signal 
    {

        public function UpgradePetSignal()
        {
            super(IUpgradePetRequestVO);
        }

    }
}//package io.decagames.rotmg.pets.signals

