package shared.realmeditor.editor.actions {
import shared.realmeditor.editor.actions.data.MapSelectData;
import shared.realmeditor.editor.ui.MainView;
import shared.realmeditor.editor.ui.MapView;

import shared.realmeditor.editor.actions.data.MapSelectData;
import shared.realmeditor.editor.ui.MainView;
import shared.realmeditor.editor.ui.MapView;

public class MapSelectAction extends MapAction {

    private var prevData:MapSelectData;
    private var newData:MapSelectData;

    public function MapSelectAction(prevData:MapSelectData, newData:MapSelectData) {
        this.prevData = prevData;
        this.newData = newData;
    }

    public override function doAction():void {
        var mapView:MapView = MainView.Instance.mapView;
        if (this.newData.startX == -1){ // Assume the rest are also -1 to clear selection
            mapView.clearTileSelection();
            return;
        }

        mapView.setLastDragAction(this.newData.lastDragAction);
        mapView.drawTileSelection(this.newData.startX, this.newData.startY, this.newData.endX, this.newData.endY);
    }

    public override function undoAction():void {
        var mapView:MapView = MainView.Instance.mapView;
        if (this.prevData.startX == -1){ // Assume the rest are also -1 to clear selection
            mapView.clearTileSelection();
            return;
        }

        mapView.setLastDragAction(this.prevData.lastDragAction);
        mapView.drawTileSelection(this.prevData.startX, this.prevData.startY, this.prevData.endX, this.prevData.endY);
    }

    public override function clone():MapAction {
        return new MapSelectAction(this.prevData, this.newData);
    }
}
}
