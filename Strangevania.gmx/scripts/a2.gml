///a2(min, max, increment)
// Creates an array of values between min and max 
//  that are multiples of increment.

var _min = argument[0];
var _max = argument[1];
var _inc = argument[2];

var _array;
var _cur = 0;
for (i=_min; i<=_max; i+=_inc)
{
    _array[_cur] = clamp(i, _min, _max);
    _cur++
}

return _array;

