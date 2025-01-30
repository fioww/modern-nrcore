package shared.realmeditor.editor.tools {
import shared.realmeditor.editor.MEBrush;
import shared.realmeditor.editor.MapTileData;
import shared.realmeditor.editor.ui.MainView;
import shared.realmeditor.editor.MapHistory;
import shared.realmeditor.editor.ui.MapView;

import shared.realmeditor.editor.MapHistory;

import shared.realmeditor.editor.ui.MainView;
import shared.realmeditor.util.IntPoint;

import shared.realmeditor.util.IntPoint;

public class MELineTool extends METool {

    public function MELineTool(view:MainView) {
        super(METool.LINE_ID, view);
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
}
}
