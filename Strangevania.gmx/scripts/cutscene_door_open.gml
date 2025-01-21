///cutscene_door_open(true/false, doorObj)

var _bool = argument[0];
var _door = noone;
if argument_count > 1
{
    _door = argument[1];
    if is_string(_door) {_door = variable_instance_get(id, "inst_"+_door);}
}
else
{
    _door = instance_nearest(x, y, obj_door);
}

with(_door)
{
    variable_instance_set(id, "open", _bool)
}

cutscene_end_action();
