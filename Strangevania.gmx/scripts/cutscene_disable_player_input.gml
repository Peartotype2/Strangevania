///cutscene_disable_player_input(true/false)

var _bool = argument[0];

with player
{
    variable_instance_set(id, "disableInput", _bool)
}

cutscene_end_action();
