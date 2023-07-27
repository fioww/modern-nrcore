// Decompiled by AS3 Sorcerer 6.78
// www.buraks.com/as3sorcerer

//kabam.rotmg.minimap.control.MiniMapZoomSignal

package kabam.rotmg.minimap.control
{
    import org.osflash.signals.Signal;

    public class MiniMapZoomSignal extends Signal 
    {

        public static const OUT:String = "OUT";
        public static const IN:String = "IN";

        public function MiniMapZoomSignal()
        {
            super(String);
        }

    }
}//package kabam.rotmg.minimap.control

