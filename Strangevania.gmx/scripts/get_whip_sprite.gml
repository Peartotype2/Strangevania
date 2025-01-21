///get_whip_sprite(whipLevel)

var _level = argument[0];
var _skin = player.whip_skin;
var _str = "";
var _skinstr = "";
var _sprite = spr_whip1;

switch(_level)
{
    case 1: _str = "spr_whip1"; break;
    case 2: _str = "spr_whip2"; break;
    case 3: _str = "spr_whip3"; break;
}

if _skin != ""
{
       _skinstr = _str + "_" + _skin;
}

var _skinasset = asset_get_index(_skinstr);
var _asset = asset_get_index(_str);

if _skinasset != -1
{
    _sprite = _skinasset;
}
else _sprite = _asset;

return _sprite;


