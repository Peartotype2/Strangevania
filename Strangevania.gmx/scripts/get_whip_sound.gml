///get_whip_sound()

var _skin = player.whip_skin;
var _snd = snd_whip;

switch(_skin)
{
    case "spine": _snd = snd_whip_spine; break;
    case "spear": _snd = snd_whip_spear; break;
    case "gold": _snd = snd_whip_gold; break;
    
}

return _snd;


