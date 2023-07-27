// Decompiled by AS3 Sorcerer 6.78
// www.buraks.com/as3sorcerer

//io.decagames.rotmg.pets.signals.DeletePetSignal

package io.decagames.rotmg.pets.signals
{
    import org.osflash.signals.Signal;

    public class DeletePetSignal extends Signal 
    {

        public var petID:int;

        public function DeletePetSignal()
        {
            super(int);
        }

    }
}//package io.decagames.rotmg.pets.signals

