///settings_update(id)

var _set, _name, _value;
if argument_count > 0
{
    var _id = argument[0];

    _set = settings.list[| _id];
    _name = _set[? "name"];
    _value = _set[? "value"];
    _visibleStat = _set[? "visible"];
    var _trueid = _set[? "id"];
    
    if _visibleStat == "NONE"
    {
        if (setting_is_visible(_trueid) == false)
        {
            setting_set_visible(_trueid, true);
        }
    }
    else if _visibleStat == "HIDDEN" {}
    else if stat_get(_visibleStat) != setting_is_visible(_trueid)
    {
        setting_set_visible(_trueid, stat_get(_visibleStat));
    }

    settings_switch(_name, _value, true);

}
else
{
    if instance_exists(modmenu_manager) or instance_exists(crtmenu_manager)
    {
        var _visibleCategory = "Modifiers";
        if instance_exists(crtmenu_manager) {_visibleCategory = "CRT";}
    
        var l = 0;
        for(l=0;l<settings.count;l++)
        {
            _set = settings.list[| l];
            _name = _set[? "name"];
            _value = _set[? "value"];
            _visibleStat = _set[? "visible"];
            var _category = _set[? "category"];
            var _trueid = _set[? "id"];
            
            if _category != _visibleCategory//"Modifiers"
            {
                if (setting_is_visible(_trueid) != false)
                {
                    setting_set_visible(_trueid, false);
                }
            }
            else if _visibleStat == "HIDDEN"
            {
                setting_set_visible(_trueid, true);
            }
            else if stat_get(_visibleStat) != setting_is_visible(_trueid)
            {
                setting_set_visible(_trueid, stat_get(_visibleStat));
            }
            //variable_instance_set(settings, "setting_"+_name, _value)
            settings_switch(_name, _value);
        }
        
        exit;
    }

    var l = 0;
    for(l=0;l<settings.count;l++)
    {
        _set = settings.list[| l];
        _name = _set[? "name"];
        _value = _set[? "value"];
        _visibleStat = _set[? "visible"];
        var _trueid = _set[? "id"];
        
        if _visibleStat == "NONE"
        {
            if (setting_is_visible(_trueid) == false)
            {
                setting_set_visible(_trueid, true);
            }
        }
        else if _visibleStat == "HIDDEN" 
        {
            if (setting_is_visible(_trueid) != false)
            {
                setting_set_visible(_trueid, false);
            }
        }
        else if stat_get(_visibleStat) != setting_is_visible(_trueid)
        {
            setting_set_visible(_trueid, stat_get(_visibleStat));
        }
        //variable_instance_set(settings, "setting_"+_name, _value)
        settings_switch(_name, _value);
    }
}
