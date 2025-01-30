package shared.realmeditor.editor.ui.elements {
import com.company.ui.BaseSimpleText;

import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;

import shared.realmeditor.editor.ui.Constants;

import shared.realmeditor.util.MoreColorUtil;

public class SimpleOkButton extends Sprite {

    private var okText:BaseSimpleText;

    public function SimpleOkButton() {
        this.okText = new BaseSimpleText(20, 0xFFFFFF);
        this.okText.setText("Ok");
        this.okText.setBold(true);
        this.okText.updateMetrics();
        this.okText.x = 3;
        this.okText.y = 3;
        this.okText.filters = Constants.SHADOW_FILTER_1;
        addChild(this.okText);

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
