package shared.realmeditor.editor.ui.elements {
import com.company.ui.BaseSimpleText;



import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;

import shared.realmeditor.editor.ui.Constants;


import com.company.util.MoreColorUtil;

public class SimpleCloseButton extends Sprite {

    private var closeText:BaseSimpleText;

    public function SimpleCloseButton() {
        this.closeText = new BaseSimpleText(20, 0xFFFFFF);
        this.closeText.setText("Close");
        this.closeText.setBold(true);
        this.closeText.updateMetrics();
        this.closeText.x = 3;
        this.closeText.y = 3;
        this.closeText.filters = Constants.SHADOW_FILTER_1;
        addChild(this.closeText);

        this.addEventListener(MouseEvent.ROLL_OVER, this.onRollOver);
        this.addEventListener(MouseEvent.ROLL_OUT, this.onRollOut);
    }

    private function onRollOver(e:Event):void {
        this.transform.colorTransform = MoreColorUtil.darkCT;
    }

    private function onRollOut(e:Event):void {
        this.transform.colorTransform = MoreColorUtil.identity;
    }
}
}
