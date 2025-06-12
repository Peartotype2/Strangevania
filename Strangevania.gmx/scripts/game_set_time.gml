///game_set_time(timeInSeconds, [instant?])

if !instance_exists(gamemanager)
{
    print("ERROR: TRIED TO SET GAME TIME WITH NO GAMEMANAGER INSTANCE!");
    return false;
}

var _newTime = argument[0]
var _instant = true; if argument_count > 1 {_instant = argument[1];}

with gamemanager
{
    stageTime = _newTime;
    if _instant {hud_timetext_num = stageTime;}
}
