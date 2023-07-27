// Decompiled by AS3 Sorcerer 6.78
// www.buraks.com/as3sorcerer

//io.decagames.rotmg.tos.popups.buttons.GoBackButton

package io.decagames.rotmg.tos.popups.buttons
{
    import io.decagames.rotmg.ui.buttons.SliceScalingButton;
    import io.decagames.rotmg.ui.texture.TextureParser;
    import io.decagames.rotmg.ui.defaults.DefaultLabelFormat;

    public class GoBackButton extends SliceScalingButton 
    {

        public function GoBackButton()
        {
            super(TextureParser.instance.getSliceScalingBitmap("UI", "generic_green_button"));
            setLabel("Go Back", DefaultLabelFormat.defaultButtonLabel);
            width = 100;
        }

    }
}//package io.decagames.rotmg.tos.popups.buttons

