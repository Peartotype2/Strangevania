///cutscene_player_look(left/right)

var _dir = argument[0];
if is_string(_dir)
{
    if _dir == "left" then _dir = 1;
    else if _dir == "right" then _dir = -1;
    else _dir = -1;
}

with(player)
{
    facing = _dir;
    image_xscale = _dir;
}

cutscene_end_action();
