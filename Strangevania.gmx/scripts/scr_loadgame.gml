///scr_loadgame

if (file_exists(SAVE_FILE_NAME))
{
    save_open(SAVE_FILE_NAME);
        global.money            = save_read_value("General", "money", 0);
        director.skin_index     = save_read_value("General", "skin_index", 0);
        director.whipskin_index = save_read_value("General", "whipskin_index", 0);
        
        var _skin_list = save_read_value("General", "newskin_list", "NONE");
        if _skin_list != "NONE" then ds_list_read(director.newskin_list, _skin_list);
        
        var _whip_list = save_read_value("General", "newwhip_list", "NONE");
        if _whip_list != "NONE" then ds_list_read(director.newwhip_list, _whip_list);
        
        //LEVELS UNLOCKED/HIGHSCORES
        for(var l=0;l<levelmanager.level_count;l++)
        {
            var _level = levelmanager.level_list[| l];
            var _name = _level[? "name"];
            var _read = save_read_value("Levels", _name, "");
            if _read != ""
            {
                var _templevel = ds_map_create();
                ds_map_read(_templevel, _read);
                _level[? "unlocked"] = _templevel[? "unlocked"];
                _level[? "score"]    = _templevel[? "score"];
                _level[? "time"]     = _templevel[? "time"];
                _level[? "rating"]   = _templevel[? "rating"];
                _level[? "rank"]     = _templevel[? "rank"];
                levelmanager.level_list[| l] = _level;
                ds_map_destroy(_templevel);
            }
        }
        level_update_ratings();
        
        //SKIN UNLOCKS
        for(i=0;i<director.skin_index_max;i++)
        {
            var _read = save_read_value("Other", "playerskin"+string(i), "");
            if _read != ""
            {
                var _skinmap = ds_map_create();
                ds_map_read(_skinmap, _read);
                director.styleinfo[i,style.owned] = _skinmap[? "owned"];
                director.styleinfo[i,style.locked] = _skinmap[? "locked"];
                ds_map_destroy(_skinmap);
            }
        }
        for(i=0;i<director.whipskin_index_max;i++)
        {
            var _read = save_read_value("Other", "whipskin"+string(i), "");
            if _read != ""
            {
                var _skinmap = ds_map_create();
                ds_map_read(_skinmap, _read);
                director.whipskin_info[i,style.owned] = _skinmap[? "owned"];
                director.whipskin_info[i,style.locked] = _skinmap[? "locked"];
                ds_map_destroy(_skinmap);
            }
        }
        
        //ACHIEVEMENTS
        for(i=0;i<achievement_count;i++)
        {
            var _ach = ach_get_info(i);
            var _name = _ach[? "name"];
            var _read = save_read_value("Achievements", _name, "");
            if _read != ""
            {
                var _tempach = ds_map_create();
                ds_map_read(_tempach, _read);
                _ach[? "progress"] = _tempach[? "progress"];
                _ach[? "unlocked"] = _tempach[? "unlocked"];
                achievement_list[| i] = _ach;
                ds_map_destroy(_tempach);
            }
            
        }
        ach_update_unlocked_count()
        
        //STATS
        var _statmap =  save_read_value("Other", "StatMap", "")
        if _statmap != ""
        {
            var _tempmap = ds_map_create();
            ds_map_read(_tempmap, _statmap); //Load map from save file onto temp map
            
            var _key = ds_map_find_first(_tempmap);
            while (!is_undefined(_key)) //Loop through temp map to merge with statMap
            {
                var _value = _tempmap[? _key];
                
                // This safely replaces or adds the saved value to the main tracker
                stattracker.statMap[? _key] = _value; 
                
                _key = ds_map_find_next(_tempmap, _key);
            }
        }
        ds_map_destroy(_tempmap);
        stat_set("SECONDS_PLAYED_SESSION", 0);
    save_close();
}

