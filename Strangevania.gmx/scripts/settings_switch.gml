///settings_switch(name, value, [singleSettingSwitch])

var _name = argument[0];
var _value = argument[1];
var _single = false;
if argument_count > 2 then _single = argument[2];

var _set = setting_get(_name);
var _category = _set[? "category"];
var _choices = _set[? "choices"];

switch(_name)
{
    //case "crtmode": global.showScanlines = _value break;
    case "achpopup": achievementmanager.showPopups = _value break;
    case "gamepadtype":
        inputmanager.preferred_gamepad = (_value+1)
        if _single then inputmanager.control_type = inputmanager.preferred_gamepad;
        //1 = xbox, 2 = PS, 3 = switch; _value is 0, 1, 2 so add one.
    break;
    //case "whipeffects": global.whipeffects = _value break;
    
    //default:
    //    variable_instance_set(settings.id, _name, _value);
    //break;
    
    
}

if _category == "CRT"
{
    if _name == "crt_reset" and _value == 1
    {
        var s = 0;
        for(s=0;s<settings.count;s++)
        {
            var __set = settings.list[| s];
            var __category = __set[? "category"];
            if __category == "CRT"
            {
                var __default = __set[? "default"];
                __set[? "value"] = __default
                settings.list[| s] = __set;
            }
        }
        settings_update();
    }
    else
    {
        var _newVal = _choices[_value];
        if string_contains("_enabled", _name) {_newVal = _value;}
        
        variable_global_set(_name, _newVal);
        //if string_contains("_enabled", _name) {stat_set(_name, _value);}
    }
}

variable_instance_set(settings.id, _name, _value);
