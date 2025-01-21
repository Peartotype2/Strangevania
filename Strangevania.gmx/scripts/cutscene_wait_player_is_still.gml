///cutscene_wait_player_is_still(true/false)
//If true will move on when player is still,
// if false will move on when player is moving

var _onStill = argument[0];

var _still = false;
if player.hsp == 0 and player.vsp == 0
{
    _still = true;
}

if _still == _onStill
{
    cutscene_end_action();
}

