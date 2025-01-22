///setting_get_choice(name, [number])

var _name = argument[0];
var _num = -1;
if argument_count > 1 then _num = argument[1];
var _set;
for(i=0;i<settings.count;i++)
{
    _set = settings.list[| i];
    if _name == _set[? "name"]
    {
        break;
    }
}

if _num == -1 then _num = _set[? "value"];
_choices = _set[? "choices"];

return _choices[_num];
