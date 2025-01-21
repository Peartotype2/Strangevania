///settings_switch(name, value, [singleSettingSwitch])

var _name = argument[0];
var _value = argument[1];
var _single = false;
if argument_count > 2 then _single = argument[2];

switch(_name)
{
    case "crtmode": global.showScanlines = _value break;
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

variable_instance_set(settings.id, _name, _value);
