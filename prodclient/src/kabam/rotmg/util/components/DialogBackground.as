﻿// Decompiled by AS3 Sorcerer 6.78
// www.buraks.com/as3sorcerer

//kabam.rotmg.util.components.DialogBackground

package kabam.rotmg.util.components
{
    import flash.display.Sprite;
    import kabam.rotmg.util.graphics.BevelRect;
    import kabam.rotmg.util.graphics.GraphicsHelper;
    import flash.display.LineScaleMode;
    import flash.display.CapsStyle;
    import flash.display.JointStyle;

    public class DialogBackground extends Sprite 
    {

        private static const BEVEL:int = 4;


        public function draw(_arg_1:int, _arg_2:int):void
        {
            var _local_3:BevelRect = new BevelRect(_arg_1, _arg_2, BEVEL);
            var _local_4:GraphicsHelper = new GraphicsHelper();
            graphics.lineStyle(1, 0xFFFFFF, 1, false, LineScaleMode.NORMAL, CapsStyle.NONE, JointStyle.ROUND, 3);
            graphics.beginFill(0x363636);
            _local_4.drawBevelRect(0, 0, _local_3, graphics);
            graphics.endFill();
        }


    }
}//package kabam.rotmg.util.components

