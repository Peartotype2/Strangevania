///cutscene_room_fadeto(room, [AlphaIncrement])

var _room = argument[0];
var _inc = 0.1;
if argument_count > 1 {_inc = argument[1]}

roomFadeTo(_room, _inc);

cutscene_end_action();
