﻿// Decompiled by AS3 Sorcerer 6.78
// www.buraks.com/as3sorcerer

//kabam.rotmg.legends.model.Legend

package kabam.rotmg.legends.model
{
    import kabam.rotmg.fame.model.FameVO;
    import flash.display.BitmapData;

    public class Legend implements FameVO 
    {

        public var isOwnLegend:Boolean;
        public var place:int;
        public var accountId:String;
        public var charId:int;
        public var name:String;
        public var totalFame:int;
        public var equipmentSlots:Vector.<int>;
        public var equipment:Vector.<int>;
        public var character:BitmapData;
        public var isFocus:Boolean;


        public function getAccountId():String
        {
            return (this.accountId);
        }

        public function getCharacterId():int
        {
            return (this.charId);
        }


    }
}//package kabam.rotmg.legends.model

