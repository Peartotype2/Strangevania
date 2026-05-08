///date_get_string()
// Returns the date from year to seconds with my preferred format

date_set_timezone(timezone_local);
var _date = date_current_datetime()

var _year    = string(date_get_year(_date));
var _month   = string(date_get_month(_date));
var _day     = string(date_get_day(_date));
var _hour    = string(date_get_hour(_date));
var _minute  = string(date_get_minute(_date));
var _sec     = string(date_get_second(_date));

if (real(_month) < 10)   { _month = "0" + _month; }
if (real(_day) < 10)     { _day = "0" + _day; }
if (real(_hour) < 10)    { _hour = "0" + _hour; }
if (real(_minute) < 10)  { _minute = "0" + _minute; }
if (real(_sec) < 10)     { _sec = "0" + _sec; }

return string_all(_year,"_",_month,"_",_day,"_",_hour,".",_minute,".",_sec);
