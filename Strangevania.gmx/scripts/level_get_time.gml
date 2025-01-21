///level_get_time(level)

var _level = argument[0];
var _id = _level[? "id"];

levelmanager.level_list[| _id] = _level;

var _time = _level[? "time"];

return _time;
