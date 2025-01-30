package shared.realmeditor.editor.actions {
import shared.realmeditor.editor.MapTileData;
import shared.realmeditor.editor.ui.MainView;
import shared.realmeditor.editor.ui.MapView;

import shared.realmeditor.editor.ui.MainView;
import shared.realmeditor.editor.ui.MapView;

public class MapEditAction extends MapAction {

    private var mapX:int;
    private var mapY:int;
    private var prevCfg:String;
    private var newCfg:String;

    public function MapEditAction(mapX:int, mapY:int, prevCfg:String, newCfg:String) {
        this.mapX = mapX;
        this.mapY = mapY;
        this.prevCfg = prevCfg;
        this.newCfg = newCfg;
    }

    public override function doAction():void {
        var mapView:MapView = MainView.Instance.mapView;
        mapView.editTileObjCfg(mapX, mapY, this.newCfg);
    }

    public override function undoAction():void {
        var mapView:MapView = MainView.Instance.mapView;
        mapView.editTileObjCfg(mapX, mapY, this.prevCfg);
    }

    public override function clone():MapAction {
        return new MapEditAction(this.mapX, this.mapY, this.prevCfg, this.newCfg);
    }
}
}
