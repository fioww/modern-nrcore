﻿//io.decagames.rotmg.pets.signals.EvolvePetSignal

package io.decagames.rotmg.pets.signals
{
    import org.osflash.signals.Signal;
    import kabam.rotmg.messaging.impl.EvolvePetInfo;

    public class EvolvePetSignal extends Signal 
    {

        public function EvolvePetSignal()
        {
            super(EvolvePetInfo);
        }

    }
}//package io.decagames.rotmg.pets.signals

