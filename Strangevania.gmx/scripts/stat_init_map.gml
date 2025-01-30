///stat_init_map();

with stattracker
{
    //OVER ALL
    var _stat = "SECONDS_PLAYED_TOTAL";
    var _displayname = "Total Playtime";
    var _default = 0;
    var _hidden = false;
    stat_register(_stat, _displayname, _default, _hidden);
    
    var _stat = "SECONDS_PLAYED_SESSION";
    var _displayname = "Session Playtime";
    var _default = 0;
    var _hidden = false;
    stat_register(_stat, _displayname, _default, _hidden);
    
    //CHEATS_ENABLED
    var _stat = "CHEATS_ENABLED";
    var _displayname = "CHEATS_ENABLED";
    var _default = 0;
    var _hidden = true;
    stat_register(_stat, _displayname, _default, _hidden);
    //event_register_script("KonamiCode", id, stat_set, _stat, 1);
    //
    
    var _stat = "FINISHED_GAME";
    var _displayname = "FINISHED_GAME";
    var _default = 0;
    var _hidden = true;
    stat_register(_stat, _displayname, _default, _hidden);
    event_register_script("FinishedGame", id, stat_set, _stat, 1);
    
    var _stat = "FORCE_INTRO";
    var _displayname = "FORCE_INTRO";
    var _default = 1;
    var _hidden = true;
    stat_register(_stat, _displayname, _default, _hidden);
    event_register_script("IntroFinished", id, stat_set, _stat, 0);
    event_register_script("FINISHED_GAME_updated", id, stat_set, _stat, 1);

    //////////////////
    //PLAYER RELATED//
    //////////////////
    var _stat = "PLAYER_KILLS";
    var _displayname = "Kills";
    var _default = 0;
    var _hidden = false;
    //ds_map_add(statMap, _stat, _default, _hidden);
    //ds_list_add(statList, _stat);
    stat_register(_stat, _displayname, _default, _hidden);
    event_register_script("PlayerKilledAI", id, stat_add, _stat, 1);
        
    var _stat = "PLAYER_PROJECTILE_KILLS";
    var _displayname = "Projectile Kills";
    var _default = 0;
    var _hidden = false;
    stat_register(_stat, _displayname, _default, _hidden);
    event_register_script("PlayerProjectileKilledAI", id, stat_add, _stat, 1);
    
    var _stat = "PLAYER_WEAPONS_USED";
    var _displayname = "Weapons Used";
    var _default = 0;
    var _hidden = false;
    stat_register(_stat, _displayname, _default, _hidden);
    event_register_script("PlayerUsesWeapon", id, stat_add, _stat, 1);
    
    var _stat = "PLAYER_WHIPS_COLLECTED";
    var _displayname = "Whips Collected";
    var _default = 0;
    var _hidden = false;
    stat_register(_stat, _displayname, _default, _hidden);
    event_register_script("PlayerCollectsWhip", id, stat_add, _stat, 1);
    
    var _stat = "PLAYER_HEARTS_COLLECTED";
    var _displayname = "Hearts Collected";
    var _default = 0;
    var _hidden = false;
    stat_register(_stat, _displayname, _default, _hidden);
    event_register_script("HeartsAdded", id, stat_add, _stat);
    
    var _stat = "PLAYER_HEARTS_SPENT";
    var _displayname = "Hearts Used";
    var _default = 0;
    var _hidden = false;
    stat_register(_stat, _displayname, _default, _hidden);
    event_register_script("HeartsSpent", id, stat_add, _stat);

    var _stat = "PLAYER_DAMAGE_TAKEN";
    var _displayname = "Damage Taken";
    var _default = 0;
    var _hidden = false;
    stat_register(_stat, _displayname, _default, _hidden);
    event_register_script("PlayerLostHealth", id, stat_add, _stat);
    
    var _stat = "PLAYER_BLOCKS_BROKEN";
    var _displayname = "Blocks Broken";
    var _default = 0;
    var _hidden = false;
    stat_register(_stat, _displayname, _default, _hidden);
    event_register_script("BlockDestroyedByWhip", id, stat_add, _stat, 1);
    
    var _stat = "PLAYER_CANDLES_BROKEN";
    var _displayname = "Candles Broken";
    var _default = 0;
    var _hidden = false;
    stat_register(_stat, _displayname, _default, _hidden);
    event_register_script("CandleDestroyed", id, stat_add, _stat, 1);
    
    var _stat = "PLAYER_STAIRS_CLIMBED";
    var _displayname = "Stairs Climbed";
    var _default = 0;
    var _hidden = false;
    stat_register(_stat, _displayname, _default, _hidden);
    event_register_script("StairStepClimbed", id, stat_add, _stat, 1);
    
    var _stat = "PLAYER_STYLES_OWNED";
    var _displayname = "Styles Owned";
    var _default = 0;
    var _hidden = false;
    stat_register(_stat, _displayname, _default, _hidden);
    event_register_script("StylePurchased", id, stat_add, _stat, 1);
    
    //////////////////
    //////////////////
    //////////////////
    
    
}
