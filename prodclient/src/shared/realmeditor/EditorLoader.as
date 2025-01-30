package shared.realmeditor {

import flash.display.Sprite;

import shared.realmeditor.editor.Parameters;
import shared.realmeditor.editor.ui.Keybinds;
import shared.realmeditor.editor.ui.MainView;

public class EditorLoader {

    private static var loaded:Boolean = false;

    public static function load(titleView:Sprite, embedded:Boolean = true):Sprite {
        if (!loaded) {
            Parameters.load();
            Keybinds.loadKeys();
        }

        var view:MainView = new MainView(titleView, embedded);
        WebMain.STAGE.addChild(view);
        loaded = true;
        return view;
    }
}
}
