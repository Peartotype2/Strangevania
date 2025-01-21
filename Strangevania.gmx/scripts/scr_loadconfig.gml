///scr_loadconfig

if (file_exists("config.ini"))
{
    ini_open("config.ini");
        director.mastervolume = ini_read_real("Main", "mastervolume", 1.00)
        director.musicvolume = ini_read_real("Main", "musicvolume", 0.50)
        director.sfxvolume = ini_read_real("Main", "sfxvolume", 0.50)
        director.fullscreen = ini_read_real("Main", "fullscreen", false)
        director.res_id = ini_read_real("Main", "resolution_id", 1)
        
    for(i=0;i<(settings.count);i++)
    {
        var _set = settings.list[| i];
        var _value = _set[? "value"];
        var _name = _set[? "name"];
        var _default = _set[? "default"];
        var _category = _set[? "category"];
        if _category == -1 then _category = "General"
        
        var _read = ini_read_real(_category, _name, _default);
        _set[? "value"] = _read;
        settings.list[| i] = _set;
    }
    settings_update();
        
    ini_close();
}

director.config_loaded = true;

