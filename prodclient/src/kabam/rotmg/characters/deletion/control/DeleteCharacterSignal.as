// Decompiled by AS3 Sorcerer 6.78
// www.buraks.com/as3sorcerer

//kabam.rotmg.characters.deletion.control.DeleteCharacterSignal

package kabam.rotmg.characters.deletion.control
{
    import org.osflash.signals.Signal;
    import com.company.assembleegameclient.appengine.SavedCharacter;

    public class DeleteCharacterSignal extends Signal 
    {

        public function DeleteCharacterSignal()
        {
            super(SavedCharacter);
        }

    }
}//package kabam.rotmg.characters.deletion.control

