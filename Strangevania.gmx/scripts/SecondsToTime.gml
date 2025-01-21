///SecondsToTime(seconds, returnArray)

//Input number of seconds
var input = argument[0];
var returnArray = false;
if argument_count > 1 {returnArray = argument[1];}

//hours, minutes, seconds
var h, m, s;

h = floor(input/3600);
m = floor(input % 3600 / 60);
s = floor(input % 3600 % 60);

var hStr = string(h);
var mStr = string(m);
var sStr = string(s);

hStr = iif((h < 10), "0" + hStr, hStr)
mStr = iif((m < 10), "0" + mStr, mStr)
sStr = iif((s < 10), "0" + sStr, sStr)

var str = (hStr + ":" + mStr + ":" + sStr);

if returnArray
{
    var result;
    result[0] = str;
    result[1] = h;
    result[2] = m;
    result[3] = s;
    
    return result;
}

return str;

