﻿//kabam.rotmg.messaging.impl.outgoing.Hello

package kabam.rotmg.messaging.impl.outgoing
{
    import flash.utils.ByteArray;
    import flash.utils.IDataOutput;

    public class Hello extends OutgoingMessage 
    {

        public var buildVersion_:String = new String();
        public var gameId_:int = 0;
        public var guid_:String = new String();
        public var password_:String = new String();
        public var secret_:String = new String();
        public var keyTime_:int = 0;
        public var key_:ByteArray = new ByteArray();
        public var mapJSON_:String = new String();

        public function Hello(_arg_1:uint, _arg_2:Function)
        {
            super(_arg_1, _arg_2);
        }

        override public function writeToOutput(_arg_1:IDataOutput):void
        {
            _arg_1.writeUTF(this.buildVersion_);
            _arg_1.writeInt(this.gameId_);
            _arg_1.writeUTF(this.guid_);
            _arg_1.writeUTF(this.password_);
            _arg_1.writeUTF(this.secret_);
            _arg_1.writeInt(this.keyTime_);
            _arg_1.writeShort(this.key_.length);
            _arg_1.writeBytes(this.key_);
            _arg_1.writeInt(this.mapJSON_.length);
            _arg_1.writeUTFBytes(this.mapJSON_);
        }

        override public function toString():String
        {
            return (formatToString("HELLO", "buildVersion_", "gameId_", "guid_", "password_", "secret_"));
        }


    }
}//package kabam.rotmg.messaging.impl.outgoing

