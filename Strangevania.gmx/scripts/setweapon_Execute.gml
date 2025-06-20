///setweapon_Execute(args)

if console.helpMessage
{
    console.commandString = "/setweapon {weaponName}"
    return "Sets the player weapon. (cross, dagger, axe, water, watch, none)";
    exit;
}

if !instance_exists(gamemanager) {return "Not in level!";}

var args = argument[0];
if (array_length_1d(args) == 1)
{
    var _weapon = string_lower(args[0]);

    var _result = undefined;
    switch(_weapon)
    {
        case "wep_none":    case "none":    _result = WEP_NONE break;
        case "wep_dagger":  case "dagger":  _result = WEP_DAGGER break;
        case "wep_axe":     case "axe":     _result = WEP_AXE break;
        case "wep_water":   case "water":   _result = WEP_WATER break;
        case "wep_cross":   case "cross":   _result = WEP_CROSS break;
        case "wep_watch":   case "watch":   _result = WEP_WATCH break;
    }
    
    if is_undefined(_result) then return "Unknown weapon. (cross, dagger, axe, water, watch, none)";
    
    audio_play_sound(snd_upgrade, 0, 0);
    gamemanager.weapon = _result;
    UpdateWeapon();
    
    _result = string_upper(_weapon);
    
    print("Weapon set to ", _result, " through command")
    return "Weapon set to: " + _result;
}
return "Invalid argument count. (cross, dagger, axe, water, watch, none)";
