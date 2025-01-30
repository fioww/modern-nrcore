package shared.realmeditor.editor.actions {
import shared.realmeditor.editor.MapDragController;
import shared.realmeditor.editor.MapDragController;
import shared.realmeditor.editor.MapHistory;
import shared.realmeditor.editor.MapTileData;
import shared.realmeditor.editor.actions.data.MapSelectData;
import shared.realmeditor.editor.ui.MainView;
import shared.realmeditor.editor.ui.MapView;
import shared.realmeditor.editor.ui.TileMapView;

import shared.realmeditor.editor.MapDragController;

import shared.realmeditor.editor.MapTileData;

import shared.realmeditor.editor.actions.data.MapSelectData;
import shared.realmeditor.editor.ui.MainView;

import shared.realmeditor.util.IntPoint;

public class MapDragAction extends MapAction {

    private var controller:MapDragController;
    private var prevAction:MapDragAction;
    public var oldTiles:Vector.<MapTileData>; // Tiles before dragging
    public var newTiles:Vector.<MapTileData>; // Tiles to draw on new area
    public var userNewTiles:Vector.<MapTileData>; // Tiles the user drew on
    private var prevSelection:MapSelectData;
    private var newSelection:MapSelectData;

    public function MapDragAction(controller:MapDragController, prevAction:MapDragAction, oldTiles:Vector.<MapTileData>, newTiles:Vector.<MapTileData>, oldSelection:MapSelectData, newSelection:MapSelectData, userNewTiles:Vector.<MapTileData> = null) {
        this.controller = controller;
        this.prevAction = prevAction;
        this.oldTiles = oldTiles;
        this.newTiles = newTiles;
        this.userNewTiles = userNewTiles;
        this.prevSelection = oldSelection;
        this.newSelection = newSelection;
    }

    public override function doAction():void {
        this.dragNewTiles(false);
    }

    public override function undoAction():void {
        this.controller.pasteTiles(this.oldTiles, this.newSelection.startX, this.newSelection.startY, this.newSelection.endX, this.newSelection.endY); // Undo this action basically

        if (this.prevAction != null) {
            this.prevAction.dragNewTiles(true); // Redo previous action boom
        } else { // Here we're basically where we started
            this.controller.pasteTiles(this.newTiles, this.prevSelection.startX, this.prevSelection.startY, this.prevSelection.endX, this.prevSelection.endY);
            MainView.Instance.mapView.selectTileArea(this.prevSelection.startX, this.prevSelection.startY, this.prevSelection.endX, this.prevSelection.endY);
            MainView.Instance.mapView.setLastDragAction(null); // Also very important
        }
    }

    private function dragNewTiles(userTiles:Boolean):void {
        var tiles:Vector.<MapTileData> = userTiles ? this.userNewTiles : this.newTiles;
        if (this.prevAction == null) {
            this.controller.clearTileArea(this.prevSelection.startX, this.prevSelection.startY, this.prevSelection.endX, this.prevSelection.endY);
        } else {
            this.controller.pasteTiles(this.prevAction.oldTiles, this.prevSelection.startX, this.prevSelection.startY, this.prevSelection.endX, this.prevSelection.endY);
        }

        this.controller.pasteTiles(tiles, this.newSelection.startX, this.newSelection.startY, this.newSelection.endX, this.newSelection.endY);

        MainView.Instance.mapView.selectTileArea(this.newSelection.startX, this.newSelection.startY, this.newSelection.endX, this.newSelection.endY); // The select action is already recorded inside moveSelectedTiles

        MainView.Instance.mapView.setLastDragAction(this); // Very important
    }

    public override function clone():MapAction {
        return new MapDragAction(this.controller, this.prevAction, this.oldTiles, this.newTiles, this.prevSelection, this.newSelection, this.userNewTiles);
    }
}
}
