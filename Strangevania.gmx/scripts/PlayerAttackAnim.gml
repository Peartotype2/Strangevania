///PlayerAttackAnim(whipSkin, whipLevel)

var _spr = spr_player_whip;
if instance_exists(player) and argument_count == 0 {var _whipskin = player.whip_skin;}
else {var _whipskin = argument[0];}
var _skinstr = "";
var _string = "spr_player_";

if instance_exists(player) {var _level = player.whip;}
else {var _level = 3;}
if argument_count > 1 {_level = argument[1];}

var _suffix = "";
if instance_exists(player)
{
    if player.crouch {_suffix = "C";}
    else if player.onStair and player.ascending {_suffix = "A";}
    else if player.onStair and !player.ascending {_suffix = "D";}
}

if _whipskin != "" //If there is a whip skin equiped
{
    //Check if the whip skin should use its name to look for a player sprite
    //or if there is an alternative named animation to use for this skin
    var _altAnim = get_whip_anim(_whipskin, _level); 
    _skinstr = (_string + _whipskin);
    
    if _altAnim != -1
    {
        _skinstr = (_string + _altAnim);
    }
}

var _noskin = _string + "whip"// + _suffix

var _suffixasset = asset_get_index(_skinstr + _suffix);
var _skinasset = asset_get_index(_skinstr);
var _asset = asset_get_index(_noskin);

if _suffixasset != -1
{
    _spr = _suffixasset;
}
else if _skinasset != -1
{
    _spr = _skinasset;
}
else
{
    _spr = _asset;
}

return _spr;
