//com.company.ui.BaseSimpleText

package com.company.ui
{
import flash.events.KeyboardEvent;
import flash.text.TextField;
    import flash.text.TextFormat;
    import flash.text.TextFieldType;
    import flash.events.Event;
    import flash.text.TextLineMetrics;

import kabam.rotmg.text.model.FontModel;

public class BaseSimpleText extends TextField 
    {

        public var inputWidth_:int;
        public var inputHeight_:int;
        public var actualWidth_:int;
        public var actualHeight_:int;

        public function BaseSimpleText(textSize:int, color:uint, makeSelectable:Boolean = false, widthParam:int = 0, heightParam:int = 0, isLink:Boolean = false, stopKeyPropagation:Boolean = false) {

            this.inputWidth_ = widthParam;
            if (this.inputWidth_ != 0) {
                width = widthParam;
            }
            this.inputHeight_ = heightParam;
            if (this.inputHeight_ != 0) {
                height = heightParam;
            }
            var format:TextFormat = defaultTextFormat;
            format.font = FontModel.DEFAULT_FONT_NAME;
            format.bold = false;
            format.size = textSize;
            format.color = color;
            embedFonts = true;
            defaultTextFormat = format;
            if (makeSelectable) {
                selectable = true;
                mouseEnabled = true;
                type = TextFieldType.INPUT;
                border = true;
                borderColor = color;
                addEventListener(Event.CHANGE, this.onChange);
                if (stopKeyPropagation) {
                    addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
                }
            } else {
                selectable = false;
                mouseEnabled = false;
            }

            if (isLink) {
                mouseEnabled = true;
            }
        }

        private static function onKeyUp(e:Event):void {
            e.stopImmediatePropagation();
        }

        public function setFont(_arg_1:String):void
        {
            var _local_2:TextFormat = defaultTextFormat;
            _local_2.font = _arg_1;
            defaultTextFormat = _local_2;
        }

        public function setSize(_arg_1:int):void
        {
            var _local_2:TextFormat = defaultTextFormat;
            _local_2.size = _arg_1;
            this.applyFormat(_local_2);
        }

        public function setColor(_arg_1:uint):void
        {
            var _local_2:TextFormat = defaultTextFormat;
            _local_2.color = _arg_1;
            this.applyFormat(_local_2);
        }

        public function setBold(_arg_1:Boolean):void
        {
            var _local_2:TextFormat = defaultTextFormat;
            _local_2.bold = _arg_1;
            this.applyFormat(_local_2);
        }

        public function setAlignment(_arg_1:String):void
        {
            var _local_2:TextFormat = defaultTextFormat;
            _local_2.align = _arg_1;
            this.applyFormat(_local_2);
        }

        public function setText(_arg_1:String):void
        {
            this.text = _arg_1;
        }

        public function setMultiLine(_arg_1:Boolean):void
        {
            multiline = _arg_1;
            wordWrap = _arg_1;
        }

        private function applyFormat(_arg_1:TextFormat):void
        {
            setTextFormat(_arg_1);
            defaultTextFormat = _arg_1;
        }

        private function onChange(_arg_1:Event):void
        {
            this.updateMetrics();
        }

        public function updateMetrics():void
        {
            var _local_2:TextLineMetrics;
            var _local_3:int;
            var _local_4:int;
            this.actualWidth_ = 0;
            this.actualHeight_ = 0;
            var _local_1:int;
            while (_local_1 < numLines)
            {
                _local_2 = getLineMetrics(_local_1);
                _local_3 = (_local_2.width + 4);
                _local_4 = (_local_2.height + 4);
                if (_local_3 > this.actualWidth_)
                {
                    this.actualWidth_ = _local_3;
                };
                this.actualHeight_ = (this.actualHeight_ + _local_4);
                _local_1++;
            };
            width = ((this.inputWidth_ == 0) ? this.actualWidth_ : this.inputWidth_);
            height = ((this.inputHeight_ == 0) ? this.actualHeight_ : this.inputHeight_);
        }

        public function useTextDimensions():void
        {
            width = ((this.inputWidth_ == 0) ? (textWidth + 4) : this.inputWidth_);
            height = ((this.inputHeight_ == 0) ? (textHeight + 4) : this.inputHeight_);
        }


    }
}//package com.company.ui

