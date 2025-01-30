package shared.realmeditor.editor.tools {
import shared.realmeditor.editor.MEBrush;
import shared.realmeditor.editor.MapHistory;
import shared.realmeditor.editor.MapTileData;
import shared.realmeditor.editor.ui.MainView;
import shared.realmeditor.editor.ui.MapView;

import shared.realmeditor.editor.MapHistory;

import shared.realmeditor.editor.ui.MainView;
import com.company.util.IntPoint;

import com.company.util.IntPoint;

public class MEShapeTool extends METool {

    public function MEShapeTool(view:MainView) {
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
