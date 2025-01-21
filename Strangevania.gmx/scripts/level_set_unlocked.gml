///level_set_unlocked(level, unlocked)

var _level  = argument[0];
var _unlocked   = argument[1];
var _id = _level[? "id"];

_level[? "unlocked"] = _unlocked;
levelmanager.level_list[| _id] = _level;
