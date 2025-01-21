///scr_savegame

if (file_exists(SAVE_FILE_NAME)) file_delete(SAVE_FILE_NAME);

//Game Save
ini_open(SAVE_FILE_NAME);
    ini_write_real("General", "money", global.money);
    ini_write_real("General", "skin_index", director.skin_index);
    ini_write_real("General", "whipskin_index", director.whipskin_index);
    
    ini_write_string("General", "newskin_list", ds_list_write(director.newskin_list));
    ini_write_string("General", "newwhip_list", ds_list_write(director.newwhip_list));
    
    //LEVELS UNLOCKED/HIGHSCORES
    for(var l=0;l<levelmanager.level_count;l++)
    {
        var _level = levelmanager.level_list[| l];
        var _name = _level[? "name"];
        var _unlocked = _level[? "unlocked"];
        var _score = _level[? "score"];
        var _time = _level[? "time"];
        var _rank = _level[? "rank"];
        
        var _templevel = ds_map_create();
        ds_map_add(_templevel, "unlocked", _unlocked);
        ds_map_add(_templevel, "score", _score);
        ds_map_add(_templevel, "time", _time);
        ds_map_add(_templevel, "rank", _rank);
        
        ini_write_string("Levels", _name, ds_map_write(_templevel));
        ds_map_destroy(_templevel);
    }
    
    
    //SKIN UNLOCKS
    for(i=0;i<director.skin_index_max;i++)
    {
        var _skinmap = ds_map_create();
        var _locked = director.styleinfo[i,style.locked];
        var _owned = director.styleinfo[i,style.owned];
        ds_map_add(_skinmap, "locked", _locked);
        ds_map_add(_skinmap, "owned", _owned);
        ini_write_string("Other", "playerskin"+string(i), ds_map_write(_skinmap));
        ds_map_destroy(_skinmap);
    }
    for(i=0;i<director.whipskin_index_max;i++)
    {
        var _skinmap = ds_map_create();
        var _locked = director.whipskin_info[i,style.locked];
        var _owned = director.whipskin_info[i,style.owned];
        ds_map_add(_skinmap, "locked", _locked);
        ds_map_add(_skinmap, "owned", _owned);
        ini_write_string("Other", "whipskin"+string(i), ds_map_write(_skinmap));
        ds_map_destroy(_skinmap);
    }
    
    //ACHIEVEMENTS
    for(i=0;i<achievement_count;i++)
    {
        var _ach = ach_get_info(i);
        var _name = _ach[? "name"];
        var _progress = _ach[? "progress"];
        var _unlocked = _ach[? "unlocked"];
        
        var _tempach = ds_map_create();
        ds_map_add(_tempach, "progress", _progress);
        ds_map_add(_tempach, "unlocked", _unlocked);
        
        ini_write_string("Achievements", _name, ds_map_write(_tempach));
        ds_map_destroy(_tempach);
    }
    
    //STATS
    ini_write_string("Other", "StatMap", ds_map_write(stattracker.statMap))
    
ini_close();
print("GAME SAVED!");

