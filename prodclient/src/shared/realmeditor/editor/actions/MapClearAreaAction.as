package shared.realmeditor.editor.actions {
import shared.realmeditor.editor.MapDragController;
import shared.realmeditor.editor.MapDragController;
import shared.realmeditor.editor.MapHistory;
import shared.realmeditor.editor.MapTileData;
import shared.realmeditor.editor.actions.data.MapSelectData;
import shared.realmeditor.editor.ui.MainView;
import shared.realmeditor.editor.ui.MapView;
import shared.realmeditor.editor.ui.TileMapView;

import shared.realmeditor.editor.MapTileData;
import shared.realmeditor.editor.ui.MainView;
import shared.realmeditor.editor.ui.TileMapView;

import shared.realmeditor.util.IntPoint;

public class MapClearAreaAction extends MapAction {

    private var tileDict:Vector.<MapTileData>;
    private var startX:int;
    private var startY:int;
    private var endX:int;
    private var endY:int;

    public function MapClearAreaAction(tileDict:Vector.<MapTileData>, startX:int, startY:int, endX:int, endY:int) {
        this.tileDict = tileDict;
        this.startX = startX;
        this.startY = startY;
        this.endX = endX;
        this.endY = endY;
    }

    public override function doAction():void {
        var startX:int = this.startX;
        var startY:int = this.startY;
        var endX:int = this.endX;
        var endY:int = this.endY;

        var tileMap:TileMapView = MainView.Instance.mapView.tileMap;
        for (var y:int = startY; y <= endY; y++) {
            for (var x:int = startX; x <= endX; x++) {
                tileMap.clearTile(x, y);
            }
        }
    }

    public override function undoAction():void {
        var startX:int = this.startX;
        var startY:int = this.startY;
        var endX:int = this.endX;
        var endY:int = this.endY;

        var idx:int = 0;
        var tileMap:TileMapView = MainView.Instance.mapView.tileMap;
        for (var y:int = startY; y <= endY; y++) {
            for (var x:int = startX; x <= endX; x++) {
                tileMap.setTileData(x, y, this.tileDict[idx]);
                tileMap.drawTile(x, y);
                idx++;
            }
        }
    }

    public override function clone():MapAction {
        return new MapClearAreaAction(this.tileDict, this.startX, this.startY, this.endX, this.endY);
    }
}
}
