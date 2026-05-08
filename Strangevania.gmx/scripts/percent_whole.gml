///percent_whole(current, min, max)
//Returns the percentage as a whole number between 0-100

var _current = argument[0];
var _min = argument[1];
var _max = argument[2];

var _difference = _max - _min;

var _percent = (_current - _min) / _difference;

return _percent*100;
