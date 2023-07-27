// Decompiled by AS3 Sorcerer 6.78
// www.buraks.com/as3sorcerer

//kabam.rotmg.chat.control.AddChatSignal

package kabam.rotmg.chat.control
{
    import kabam.lib.signals.DeferredQueueSignal;
    import kabam.rotmg.chat.model.ChatMessage;

    public class AddChatSignal extends DeferredQueueSignal 
    {

        public function AddChatSignal()
        {
            super(ChatMessage);
        }

    }
}//package kabam.rotmg.chat.control

