///console_log(string)

var _listSize = ds_list_size(console.debugLog);

var _str = ("["+string(console.debugLogCount)+"] ");
_str += string(argument[0]);


//console.debugLog += _str+"#";
ds_list_add(console.debugLog, _str);
console.debugLogCount++;

if _listSize > console.debugLogMaxSize
{
    ds_list_delete(console.debugLog, 0);
}
