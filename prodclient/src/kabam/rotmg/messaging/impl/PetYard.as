﻿// Decompiled by AS3 Sorcerer 6.78
// www.buraks.com/as3sorcerer

//kabam.rotmg.messaging.impl.PetYard

package kabam.rotmg.messaging.impl
{
    import kabam.rotmg.messaging.impl.incoming.IncomingMessage;
    import flash.utils.IDataInput;

    public class PetYard extends IncomingMessage 
    {

        public var type:int;

        public function PetYard(_arg_1:uint, _arg_2:Function)
        {
            super(_arg_1, _arg_2);
        }

        override public function parseFromInput(_arg_1:IDataInput):void
        {
            this.type = _arg_1.readInt();
        }


    }
}//package kabam.rotmg.messaging.impl

