package shared.realmeditor.editor.ui.elements {
import com.company.ui.BaseSimpleText;

import flash.display.Sprite;

public class SimpleInputBox extends Sprite {

    public var inputText:BaseSimpleText;

    public function SimpleInputBox(width:int, height:int, inputText:String = "", inputSize:int = 18, inputColor:uint = 0xFFFFFF) {
        this.inputText = new BaseSimpleText(inputSize, inputColor, true, width, height);
        this.inputText.text = inputText;
        this.inputText.updateMetrics();
        addChild(this.inputText);
    }
}
}
