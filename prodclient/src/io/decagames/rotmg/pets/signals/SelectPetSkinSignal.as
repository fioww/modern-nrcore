﻿//io.decagames.rotmg.pets.signals.SelectPetSkinSignal

package io.decagames.rotmg.pets.signals
{
    import org.osflash.signals.Signal;
    import io.decagames.rotmg.pets.data.vo.IPetVO;

    public class SelectPetSkinSignal extends Signal 
    {

        public function SelectPetSkinSignal()
        {
            super(IPetVO);
        }

    }
}//package io.decagames.rotmg.pets.signals

