///percent(current, min, max)

var _current = argument[0];
var _min = argument[1];
var _max = argument[2];

var _difference = _max - _min;

var _percent = (_current - _min) / _difference;

return _percent;
