///level_update_ratings()

var _max = levelmanager.level_count
var _time, _score, _level, _newRating;

for(var i = 0; i < _max; i++)
{
    _level  = levelmanager.level_list[| i];
    _score  = _level[? "score"];
    _time   = _level[? "time"];
    
    _newRating = level_calc_rating(_level, _score, _time);
    level_set_rating(_level, _newRating);
}
