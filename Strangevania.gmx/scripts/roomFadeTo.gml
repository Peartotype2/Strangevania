///roomFadeTo(room, alphaIncrement)
var _inc = 0.1;
if argument_count > 1 {_inc = argument[1]}
with instance_create(0, 0, obj_fadeto)
{
    newroom = argument[0];
    inc = _inc;
}

