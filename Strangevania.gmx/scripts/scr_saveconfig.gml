///scr_saveconfig()

//if (file_exists("config.ini")) file_delete("config.ini");

ini_open("config.ini");
    ini_write_real("Main", "mastervolume", director.mastervolume);
    ini_write_real("Main", "musicvolume", director.musicvolume);
    ini_write_real("Main", "sfxvolume", director.sfxvolume);
    ini_write_real("Main", "fullscreen", director.fullscreen);
    ini_write_real("Main", "resolution_id", director.res_id);
    
    for(i=0;i<(settings.count);i++)
    {
        var _set = settings.list[| i];
        var _value = _set[? "value"]
        var _name = _set[? "name"]
        var _var = _set[? "var"]
        var _category = _set[? "category"];
        if _category == -1 then _category = "General"
        
        if _var == -1
        {
            //variable_instance_set(settings, "setting_"+_name, )
            ini_write_real(_category, _name, _value);
        }
        else
        {
            //ini_write_real("General", _name, _value);
        }
    }
ini_close();
print("CONFIG SAVED!");
    
