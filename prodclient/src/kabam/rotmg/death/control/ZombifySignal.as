// Decompiled by AS3 Sorcerer 6.78
// www.buraks.com/as3sorcerer

//kabam.rotmg.death.control.ZombifySignal

package kabam.rotmg.death.control
{
    import org.osflash.signals.Signal;
    import kabam.rotmg.messaging.impl.incoming.Death;

    public class ZombifySignal extends Signal 
    {

        public function ZombifySignal()
        {
            super(Death);
        }

    }
}//package kabam.rotmg.death.control

