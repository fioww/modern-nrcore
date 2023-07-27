//io.decagames.rotmg.seasonalEvent.signals.RequestChallengerListSignal

package io.decagames.rotmg.seasonalEvent.signals
{
    import org.osflash.signals.Signal;
    import kabam.rotmg.legends.model.Timespan;

    public class RequestChallengerListSignal extends Signal 
    {

        public function RequestChallengerListSignal()
        {
            super(Timespan, String);
        }

    }
}//package io.decagames.rotmg.seasonalEvent.signals

