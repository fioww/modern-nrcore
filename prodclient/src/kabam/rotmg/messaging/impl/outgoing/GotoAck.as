﻿//kabam.rotmg.messaging.impl.outgoing.GotoAck

package kabam.rotmg.messaging.impl.outgoing
{
    import flash.utils.IDataOutput;

    public class GotoAck extends OutgoingMessage 
    {

        public var time_:int;

        public function GotoAck(_arg_1:uint, _arg_2:Function)
        {
            super(_arg_1, _arg_2);
        }

        override public function writeToOutput(_arg_1:IDataOutput):void
        {
            _arg_1.writeInt(this.time_);
        }

        override public function toString():String
        {
            return (formatToString("GOTOACK", "time_"));
        }


    }
}//package kabam.rotmg.messaging.impl.outgoing

