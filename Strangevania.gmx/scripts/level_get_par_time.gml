///level_get_par_time(level)

var _level = argument[0];
var _id = _level[? "id"];

_level = levelmanager.level_list[| _id];

var _parTime = _level[? "parTime"];

return _parTime;
