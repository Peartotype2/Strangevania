///level_set_time(level, time)

var _level  = argument[0];
var _time   = argument[1];
var _id = _level[? "id"];

_level[? "time"] = _time;
levelmanager.level_list[| _id] = _level;
