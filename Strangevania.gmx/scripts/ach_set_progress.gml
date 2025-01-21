///ach_set_progress(name/id, amount, popup)
var argcount = argument_count;

var _name = argument[0];
var _amt = argument[1];
var _popup = -1;
if argcount >= 3 then {_popup = argument[2];}

var _ach = ach_get_info(_name);
if is_undefined(_ach) then exit;

if stat_get("CHEATS_ENABLED")
{
    print("CHEATS PREVENTING ACHIEVEMENT PROGRESSION ["+string(_name)+"]");
    exit;
}

var _total = _ach[? "progresstotal"];
var _id = _ach[? "id"];
var _showprogress = _ach[? "showprogress"];

if _popup == -1 and _amt < _total and _showprogress
{
    var _miles = _ach[? "milestones"];
    var len = array_length_1d(_miles);
    for(i=0;i<len;i++)
    {
        if _amt == _miles[i]
        {
            _popup = true;
            break;
        }
    }
}

_ach[? "progress"] = min(_amt, _total);
achievement_list[| _id] = _ach;

if _amt >= _total
{
    ach_award(_id);
}
else if _popup
{
    ach_queue_popup(_id);
}


