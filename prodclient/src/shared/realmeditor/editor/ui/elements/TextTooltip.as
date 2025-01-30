package shared.realmeditor.editor.ui.elements {
import com.company.ui.BaseSimpleText;

import flash.display.DisplayObject;

public class TextTooltip extends Tooltip {

    private var textField:BaseSimpleText;
    private var subTextField:BaseSimpleText;

    public function TextTooltip(target:DisplayObject, text:String, size:int = 18, color:uint = 0xFFFFFF, bold:Boolean = false) {
        this.textField = new BaseSimpleText(size, color);
        this.textField.setText(text);
        this.textField.setBold(bold);
        this.textField.useTextDimensions();

        super(target);
    }

    protected override function addChildren():void {
        addChild(this.textField);
        if (this.subTextField){
            addChild(this.subTextField);
        }
    }

    protected override function positionChildren():void {
        this.textField.x = 5;
        this.textField.y = 5;

        if (this.subTextField){
            this.subTextField.x = this.textField.x;
            this.subTextField.y = this.textField.y + this.textField.height;
        }
    }

    public function addSubText(text:String, size:int = 14, color:uint = 0xFFFFFF, bold:Boolean = false):void {
        this.subTextField = new BaseSimpleText(size, color);
        this.subTextField.setText(text);
        this.subTextField.setBold(bold);
        this.subTextField.useTextDimensions();

        this.updateChildren();
    }
}
}
