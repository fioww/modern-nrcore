﻿//com.company.assembleegameclient.objects.TextureDataConcrete

package com.company.assembleegameclient.objects
{
import com.company.assembleegameclient.appengine.RemoteTexture;
import com.company.assembleegameclient.objects.particles.EffectProperties;
import com.company.assembleegameclient.util.AnimatedChar;
import com.company.assembleegameclient.util.AnimatedChars;
import com.company.assembleegameclient.util.AssetLoader;
import com.company.assembleegameclient.util.MaskedImage;
import com.company.util.AssetLibrary;

import flash.display.BitmapData;
import flash.geom.Rectangle;
import flash.utils.Dictionary;

import kabam.rotmg.application.api.ApplicationSetup;
import kabam.rotmg.core.StaticInjectorContext;

public class TextureDataConcrete extends TextureData
    {

        public static var remoteTexturesUsed:Boolean = false;

        private var isUsingLocalTextures:Boolean;

        public function TextureDataConcrete(xml:XML, region:Boolean = false)
        {
            var _local_2:XML;
            super();
            if (region){
                this.texture_ = new BitmapData(8, 8, true, 0);
                this.texture_.fillRect(new Rectangle(0, 0, 8, 8), 1593835520 | int(xml.Color));
                return;
            }

            this.isUsingLocalTextures = this.getWhetherToUseLocalTextures();
            if (xml.hasOwnProperty("Texture"))
            {
                this.parse(XML(xml.Texture), String(xml.@id));
            }
            else
            {
                if (xml.hasOwnProperty("AnimatedTexture"))
                {
                    this.parse(XML(xml.AnimatedTexture), String(xml.@id));
                }
                else
                {
                    if (xml.hasOwnProperty("RemoteTexture"))
                    {
                        this.parse(XML(xml.RemoteTexture));
                    }
                    else
                    {
                        if (xml.hasOwnProperty("RandomTexture"))
                        {
                            this.parse(XML(xml.RandomTexture), String(xml.@id));
                        }
                        else
                        {
                            this.parse(xml);
                        };
                    };
                };
            };
            for each (_local_2 in xml.AltTexture)
            {
                this.parse(_local_2);
            };
            if (xml.hasOwnProperty("Mask"))
            {
                this.parse(XML(xml.Mask));
            };
            if (xml.hasOwnProperty("Effect"))
            {
                this.parse(XML(xml.Effect));
            };
        }

        override public function getTexture(_arg_1:int=0):BitmapData
        {
            if (randomTextureData_ == null)
            {
                return (texture_);
            };
            var _local_2:TextureData = randomTextureData_[(_arg_1 % randomTextureData_.length)];
            return (_local_2.getTexture(_arg_1));
        }

        override public function getAltTextureData(_arg_1:int):TextureData
        {
            if (altTextures_ == null)
            {
                return (null);
            };
            return (altTextures_[_arg_1]);
        }

        private function getWhetherToUseLocalTextures():Boolean
        {
            var _local_1:ApplicationSetup = StaticInjectorContext.getInjector().getInstance(ApplicationSetup);
            return (_local_1.useLocalTextures());
        }

        private function parse(xml:XML, id:String=""):void
        {
            var image:MaskedImage;
            var remoteTexture:RemoteTexture;
            var childXML:XML;
            switch (xml.name().toString())
            {
                case "Texture":
                    try
                    {
                        texture_ = AssetLibrary.getImageFromSet(String(xml.File), int(xml.Index));
                    }
                    catch(error:Error)
                    {
                        throw (new Error(((((("Error loading Texture for " + id) + " - name: ") + String(xml.File)) + " - idx: ") + int(xml.Index))));
                    };
                    return;
                case "Mask":
                    mask_ = AssetLibrary.getImageFromSet(String(xml.File), int(xml.Index));
                    return;
                case "Effect":
                    effectProps_ = new EffectProperties(xml);
                    return;
                case "AnimatedTexture":
                    animatedChar_ = AnimatedChars.getAnimatedChar(String(xml.File), int(xml.Index));
                    try
                    {
                        image = animatedChar_.imageFromAngle(0, AnimatedChar.STAND, 0);
                        texture_ = image.image_;
                        mask_ = image.mask_;
                    }
                    catch(error:Error)
                    {
                        throw (new Error(((((("Error loading AnimatedTexture for " + id) + " - name: ") + String(xml.File)) + " - idx: ") + int(xml.Index))));
                    };
                    return;
                case "RemoteTexture":
                    texture_ = AssetLibrary.getImageFromSet("lofiObj3", 0xFF);
                    if (this.isUsingLocalTextures)
                    {
                        remoteTexture = new RemoteTexture(xml.Id, xml.Instance, this.onRemoteTexture);
                        remoteTexture.run();
                        if (!AssetLoader.currentXmlIsTesting)
                        {
                            remoteTexturesUsed = true;
                        };
                    };
                    remoteTextureDir_ = ((xml.hasOwnProperty("Right")) ? AnimatedChar.RIGHT : AnimatedChar.DOWN);
                    return;
                case "RandomTexture":
                    try
                    {
                        randomTextureData_ = new Vector.<TextureData>();
                        for each (childXML in xml.children())
                        {
                            randomTextureData_.push(new TextureDataConcrete(childXML));
                        };
                    }
                    catch(error:Error)
                    {
                        throw (new Error(("Error loading RandomTexture for " + id)));
                    };
                    return;
                case "AltTexture":
                    if (altTextures_ == null)
                    {
                        altTextures_ = new Dictionary();
                    };
                    altTextures_[int(xml.@id)] = new TextureDataConcrete(xml);
                    return;
            };
        }

        private function onRemoteTexture(_arg_1:BitmapData):void
        {
            if (_arg_1)
            {
                if (_arg_1.width > 16)
                {
                    AnimatedChars.add("remoteTexture", _arg_1, null, (_arg_1.width / 7), _arg_1.height, _arg_1.width, _arg_1.height, remoteTextureDir_);
                    animatedChar_ = AnimatedChars.getAnimatedChar("remoteTexture", 0);
                    texture_ = animatedChar_.imageFromAngle(0, AnimatedChar.STAND, 0).image_;
                }
                else
                {
                    texture_ = _arg_1;
                };
            };
        }


    }
}//package com.company.assembleegameclient.objects

