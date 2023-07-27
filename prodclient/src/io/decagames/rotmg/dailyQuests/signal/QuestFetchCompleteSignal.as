﻿//io.decagames.rotmg.dailyQuests.signal.QuestFetchCompleteSignal

package io.decagames.rotmg.dailyQuests.signal
{
    import org.osflash.signals.Signal;
    import io.decagames.rotmg.dailyQuests.messages.incoming.QuestFetchResponse;

    public class QuestFetchCompleteSignal extends Signal 
    {

        public function QuestFetchCompleteSignal()
        {
            super(QuestFetchResponse);
        }

    }
}//package io.decagames.rotmg.dailyQuests.signal

