﻿//kabam.lib.math.easing.Expo

package kabam.lib.math.easing
{
    public class Expo 
    {


        public static function easeIn(_arg_1:Number):Number
        {
            return ((_arg_1 == 0) ? 0 : (Math.pow(2, (10 * (_arg_1 - 1))) - 0.001));
        }

        public static function easeOut(_arg_1:Number):Number
        {
            return ((_arg_1 == 1) ? 1 : (-(Math.pow(2, (-10 * _arg_1))) + 1));
        }

        public static function easeInOut(_arg_1:Number):Number
        {
            if (((_arg_1 == 0) || (_arg_1 == 1)))
            {
                return (_arg_1);
            };
            if ((_arg_1 = (_arg_1 * 2)) < 1)
            {
                return (0.5 * Math.pow(2, (10 * (_arg_1 - 1))));
            };
            return (0.5 * (-(Math.pow(2, (-10 * (_arg_1 - 1)))) + 2));
        }


    }
}//package kabam.lib.math.easing

