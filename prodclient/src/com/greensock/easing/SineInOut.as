// Decompiled by AS3 Sorcerer 6.78
// www.buraks.com/as3sorcerer

//com.greensock.easing.SineInOut

package com.greensock.easing
{
    public final class SineInOut extends Ease 
    {

        public static var ease:SineInOut = new (SineInOut)();


        override public function getRatio(_arg_1:Number):Number
        {
            return (-0.5 * (Math.cos((Math.PI * _arg_1)) - 1));
        }


    }
}//package com.greensock.easing

