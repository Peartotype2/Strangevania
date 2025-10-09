///level_get_score(level)

var _level = argument[0];
var _id = _level[? "id"];

//DEV DEBUG! NOT SURE IF I DID THIS BACKWARDS ORIGINALLY?
// REVERSED IT SO IT MAKES SENSE TO ME BUT MAY CAUSE ISSUES
// IF IT WAS LIKE THIS FOR A REASON?
//levelmanager.level_list[| _id] = _level;
_level = levelmanager.level_list[| _id];

var _score = _level[? "score"];

return _score;
