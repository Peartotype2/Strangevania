///level_set_score(level, score)

var _level = argument[0];
var _score = argument[1];
var _id = _level[? "id"];

_level[? "score"] = _score;
levelmanager.level_list[| _id] = _level;
