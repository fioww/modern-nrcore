package shared.realmeditor.editor.tools {
import shared.realmeditor.editor.MEBrush;
import shared.realmeditor.editor.MEDrawType;
import shared.realmeditor.editor.MapTileData;
import shared.realmeditor.editor.ui.MainView;
import shared.realmeditor.editor.MapHistory;
import shared.realmeditor.editor.ui.MapView;

import shared.realmeditor.editor.MEBrush;

import shared.realmeditor.editor.MapHistory;
import shared.realmeditor.editor.MapTileData;

import shared.realmeditor.editor.ui.MainView;
import shared.realmeditor.util.IntPoint;

import shared.realmeditor.util.IntPoint;

public class MEPickerTool extends METool {

    public function MEPickerTool(view:MainView) {
        super(METool.PICKER_ID, view);
    }

    public override function init(tilePos:IntPoint, history:MapHistory):void {
        if (tilePos == null){
            return;
        }

        this.mainView.mapView.highlightTile(tilePos.x_, tilePos.y_);
    }

    public override function mouseMoved(tilePos:IntPoint, history:MapHistory):void {
        if (tilePos == null){
            return;
        }

        this.mainView.mapView.highlightTile(tilePos.x_, tilePos.y_);
    }

    public override function tileClick(tilePos:IntPoint, history:MapHistory):void {
        if (tilePos == null){
            return;
        }

        var userBrush:MEBrush = this.mainView.userBrush;
        var tileData:MapTileData = this.mainView.mapView.tileMap.getTileData(tilePos.x_, tilePos.y_);
        if (tileData == null) {
            return;
        }

        if (tileData.groundType != -1) {
            userBrush.setGroundType(tileData.groundType);
        }
        if (tileData.objType != 0) {
            userBrush.setObjectType(tileData.objType);
        }
        if (tileData.regType != 0) {
            userBrush.setRegionType(tileData.regType);
        }

        this.mainView.updateDrawElements();
    }
}
}
