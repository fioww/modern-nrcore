﻿//com.company.assembleegameclient.util.PlayerUtil

package com.company.assembleegameclient.util
{
    import com.company.assembleegameclient.parameters.Parameters;
    import io.decagames.rotmg.supportCampaign.data.SupporterCampaignModel;
    import com.company.assembleegameclient.objects.Player;

    public class PlayerUtil 
    {


        public static function getPlayerNameColor(_arg_1:Player):Number
        {
            if (_arg_1.isFellowGuild_)
            {
                return (Parameters.FELLOW_GUILD_COLOR);
            };
            if (_arg_1.legendaryRank_ != 0)
            {
                return (_arg_1.legendaryRank_);
            };
            if (_arg_1.nameChosen_)
            {
                return (Parameters.NAME_CHOSEN_COLOR);
            };
            return (0xFFFFFF);
        }


    }
}//package com.company.assembleegameclient.util

