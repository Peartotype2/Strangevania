///level_get_rating(level)

var _level = argument[0];
var _id = _level[? "id"];

_level = levelmanager.level_list[| _id];

var _rating = _level[? "rating"];

return _rating;
