// Decompiled by AS3 Sorcerer 6.78
// www.buraks.com/as3sorcerer

//kabam.lib.console.signals.ConsoleLogSignal

package kabam.lib.console.signals
{
    import kabam.lib.signals.DeferredQueueSignal;

    public final class ConsoleLogSignal extends DeferredQueueSignal 
    {

        public function ConsoleLogSignal()
        {
            super(String);
        }

    }
}//package kabam.lib.console.signals

