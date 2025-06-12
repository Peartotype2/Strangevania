///get_whip_sound_info()

var _skin = player.whip_skin;
var _snd = snd_whip;
var _pitchMin = "default";
var _pitchMax = "default";

switch(_skin)
{
    case "spine": _snd = snd_whip_spine; break;
    case "spear": _snd = snd_whip_spear; _pitchMin = 0.85; _pitchMax = 1.3; break;
    case "gold": _snd = snd_whip_gold; break;
    
}

var _infoArray = array_create(3);
_infoArray[0] = _snd;
_infoArray[1] = _pitchMin;
_infoArray[2] = _pitchMax;

return _infoArray;//_snd;


