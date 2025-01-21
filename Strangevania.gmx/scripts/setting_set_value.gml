///setting_set_value(name/id, value)

var _name = argument[0];
var _value = argument[1];
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
}

_set[? "value"] = _value;
settings.list[| _id] = _set;
settings_update(_id);
