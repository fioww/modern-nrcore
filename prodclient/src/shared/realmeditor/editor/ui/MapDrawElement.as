package shared.realmeditor.editor.ui {
import com.company.assembleegameclient.map.GroundLibrary;
import com.company.assembleegameclient.map.RegionLibrary;
import com.company.assembleegameclient.objects.ObjectLibrary;

import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;

import shared.realmeditor.editor.MEDrawType;

import shared.realmeditor.editor.ui.elements.DrawListTooltip;

public class MapDrawElement extends Sprite {

    public var elementType:int;
    public var texture:BitmapData;
    private var drawType:int;
    private var tooltip:DrawListTooltip;

    public function MapDrawElement(elementType:int, texture:BitmapData, drawType:int) {
        this.elementType = elementType;
        this.drawType = drawType;
        this.texture = texture;
        addChild(new Bitmap(texture));

        this.addEventListener(MouseEvent.ROLL_OVER, this.onRollOver);
    }

    private function onRollOver(e:Event):void {
        this.removeEventListener(MouseEvent.ROLL_OVER, this.onRollOver);

        var xml:XML;
        switch(this.drawType){
            case MEDrawType.GROUND:
                xml = GroundLibrary.xmlLibrary_[this.elementType];
                break;
            case MEDrawType.OBJECTS:
                xml = ObjectLibrary.xmlLibrary_[this.elementType];
                break;
            case MEDrawType.REGIONS:
                xml = RegionLibrary.xmlLibrary_[this.elementType];
                break;
        }

        if (xml == null){
            return;
        }

        this.tooltip = new DrawListTooltip(this, this.texture, xml, this.drawType);
        MainView.Main.stage.addChild(this.tooltip);
    }
}
}
