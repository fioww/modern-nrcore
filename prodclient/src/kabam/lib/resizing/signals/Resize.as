﻿//kabam.lib.resizing.signals.Resize

package kabam.lib.resizing.signals
{
    import org.osflash.signals.Signal;
    import flash.geom.Rectangle;

    public class Resize extends Signal 
    {

        public function Resize()
        {
            super(Rectangle);
        }

    }
}//package kabam.lib.resizing.signals

