﻿// Decompiled by AS3 Sorcerer 6.78
// www.buraks.com/as3sorcerer

//kabam.rotmg.messaging.impl.outgoing.OutgoingMessage

package kabam.rotmg.messaging.impl.outgoing
{
    import kabam.lib.net.impl.Message;
    import flash.utils.IDataInput;

    public class OutgoingMessage extends Message 
    {

        public function OutgoingMessage(_arg_1:uint, _arg_2:Function)
        {
            super(_arg_1, _arg_2);
        }

        final override public function parseFromInput(_arg_1:IDataInput):void
        {
            throw (new Error((("Client should not receive " + id) + " messages")));
        }


    }
}//package kabam.rotmg.messaging.impl.outgoing

