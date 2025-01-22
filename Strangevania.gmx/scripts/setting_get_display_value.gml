///setting_get_display_value(id/name)
//DEBUG UNUSED, NOT USED ANYWHERE
//USELESS USELESS USELESS CODE SMH

var _name = argument[0];
var _value = -1;
var _id = -1;
var _set = -1;

if is_string(_name)
{
    for(i=0;i<settings.count;i++)
    {
        _set = settings.list[| i];
        if _name == _set[? "name"]
        {
            _id  = _set[? "id"];
            break;
        }
    }
}
else
{
    _id  = _name;
    _set = settings.list[| _id];
    _name = _set[? "name"]
}

_value = _set[? "value"];
_category = _set[? "category"];

if _category == "CRT" and !string_contains("_enabled", _name)
{
    _value *= 100;
    _value = string(_value)+"%";
}

return _value;
