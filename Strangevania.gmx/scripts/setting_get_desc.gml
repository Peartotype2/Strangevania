///setting_get_desc(name/id)

var _name = argument[0];
var _desc = "ERROR GETTING DESC";
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

_desc = _set[? "desc"];
return _desc;

