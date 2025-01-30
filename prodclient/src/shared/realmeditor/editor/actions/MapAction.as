package shared.realmeditor.editor.actions {

public class MapAction {

    public static const DRAW_TILE:int = 0;
    public static const DRAW_OBJECT:int = 1;
    public static const DRAW_REGION:int = 2;
    public static const ERASE_TILE:int = 3;
    public static const ERASE_OBJECT:int = 4;
    public static const ERASE_REGION:int = 5;
    public static const EDIT_OBJ_NAME:int = 6;
    public static const PASTE:int = 7;
    public static const FILL_GROUND:int = 8;
    public static const FILL_OBJECT:int = 9;
    public static const FILL_REGION:int = 10;
    public static const TILE_REPLACED:int = 11;
    public static const SELECT_AREA:int = 12;

    public var swapped:Boolean = false; // This makes the action redo when undoAction is called and viceversa

    public function MapAction() {
    }

    public virtual function doAction():void { }
    public virtual function undoAction():void { }
    public virtual function clone():MapAction { return null; }
}
}
