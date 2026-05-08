///setting_set_desc(name/id, desc)

var _name = argument[0];
var _desc = argument[1];
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

_set[? "desc"] = _desc;
settings.list[| _id] = _set;
