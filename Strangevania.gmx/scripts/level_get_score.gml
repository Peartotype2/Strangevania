///level_get_score(level)

var _level = argument[0];
var _id = _level[? "id"];

levelmanager.level_list[| _id] = _level;

var _score = _level[? "score"];

return _score;
