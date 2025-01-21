///get_whip_anim(whipSkin, whipLevel)

var _skin = argument[0];
var _level = argument[1];
var _anim = -1;

switch(_skin)
{
    case "spear":
        if _level == 1 {_anim = "spear_short";}
        if _level == 2 {_anim = "spear_short";}
        if _level == 3 {_anim = "spear";}
    break;
}

return _anim;

