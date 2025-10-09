///level_get_par_score(level)

var _level = argument[0];
var _id = _level[? "id"];

_level = levelmanager.level_list[| _id];

var _parScore = _level[? "parScore"];

return _parScore;
