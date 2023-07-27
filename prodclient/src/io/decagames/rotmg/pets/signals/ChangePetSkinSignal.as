// Decompiled by AS3 Sorcerer 6.78
// www.buraks.com/as3sorcerer

//io.decagames.rotmg.pets.signals.ChangePetSkinSignal

package io.decagames.rotmg.pets.signals
{
    import org.osflash.signals.Signal;
    import io.decagames.rotmg.pets.data.vo.IPetVO;

    public class ChangePetSkinSignal extends Signal 
    {

        public function ChangePetSkinSignal()
        {
            super(IPetVO);
        }

    }
}//package io.decagames.rotmg.pets.signals

