﻿// Decompiled by AS3 Sorcerer 6.78
// www.buraks.com/as3sorcerer

//kabam.rotmg.messaging.impl.incoming.Goto

package kabam.rotmg.messaging.impl.incoming
{
    import kabam.rotmg.messaging.impl.data.WorldPosData;
    import flash.utils.IDataInput;

    public class Goto extends IncomingMessage 
    {

        public var objectId_:int;
        public var pos_:WorldPosData = new WorldPosData();

        public function Goto(_arg_1:uint, _arg_2:Function)
        {
            super(_arg_1, _arg_2);
        }

        override public function parseFromInput(_arg_1:IDataInput):void
        {
            this.objectId_ = _arg_1.readInt();
            this.pos_.parseFromInput(_arg_1);
        }

        override public function toString():String
        {
            return (formatToString("GOTO", "objectId_", "pos_"));
        }


    }
}//package kabam.rotmg.messaging.impl.incoming

