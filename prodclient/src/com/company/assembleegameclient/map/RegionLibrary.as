//com.company.assembleegameclient.map.RegionLibrary

package com.company.assembleegameclient.map
{
import com.company.assembleegameclient.objects.TextureDataConcrete;

import flash.utils.Dictionary;

    public class RegionLibrary 
    {

        public static const xmlLibrary_:Dictionary = new Dictionary();
        public static var typeToTextureData_:Dictionary = new Dictionary();
        public static var idToType_:Dictionary = new Dictionary();
        public static const ENTRY_REGION_TYPE:uint = 1;
        public static const EXIT_REGION_TYPE:uint = 48;


        public static function parseFromXML(_arg_1:XML):void
        {
            var _local_2:XML;
            var _local_3:int;
            for each (_local_2 in _arg_1.Region)
            {
                _local_3 = int(_local_2.@type);
                xmlLibrary_[_local_3] = _local_2;
                idToType_[String(_local_2.@id)] = _local_3;
                typeToTextureData_[_local_3] = new TextureDataConcrete(_local_2, true);
            }
        }

        public static function getIdFromType(_arg_1:int):String
        {
            var _local_2:XML = xmlLibrary_[_arg_1];
            if (_local_2 == null)
            {
                return (null);
            };
            return (String(_local_2.@id));
        }

        public static function getColor(_arg_1:int):uint
        {
            var _local_2:XML = xmlLibrary_[_arg_1];
            if (_local_2 == null)
            {
                return (0);
            };
            return (uint(_local_2.Color));
        }

        public static function search(text:String):Vector.<int> {
            var ret:Vector.<int> = new Vector.<int>();
            for (var item:String in idToType_) {
                if (item.toLowerCase().indexOf(text.toLowerCase()) != -1) {
                    ret.push(idToType_[item]);
                }
            }
            return ret;
        }

    }
}//package com.company.assembleegameclient.map

