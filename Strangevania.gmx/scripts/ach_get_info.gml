///ach_get_info(name)

var _arg = argument[0]

var _name = undefined;
var _id = 0;
var _info = undefined;

if is_string(_arg) //If argument is a string
{
    _name = _arg;
    for(i=0;i<achievement_count;i++)
    {
        var _tempach = achievement_list[| i]
        if _tempach[? "name"] == _name
        {
            _info = _tempach;
            break;
        }
    }
}
else if is_real(_arg) //If argument is real number
{
    _id = _arg;
    _info = achievement_list[| _id]
}

//var _info = achievementmanager.achievement_list[? _name]

if is_undefined(_info)
{
    //show_debug_message("CAN'T GET UNDEFINED ACHIEVEMENT!");
    return undefined;
}

return _info;
