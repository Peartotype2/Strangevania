///level_set_rating(level, rating)

var _level = argument[0];
var _rating = argument[1];
var _id = _level[? "id"];

_level[? "rating"] = _rating;
levelmanager.level_list[| _id] = _level;
