///ach_add_progress(name/id, amount, popup)
var argcount = argument_count;

var _name = argument[0];
var _amt = 1;
var _popup = -1;
if argcount >= 2 then {_amt = argument[1];}
if argcount >= 3 then {_popup = argument[2];}

var _ach = ach_get_info(_name);
if is_undefined(_ach) then exit;

var _total = _ach[? "progresstotal"];
var _id = _ach[? "id"];
var _showprogress = _ach[? "showprogress"];

var _prog = _ach[? "progress"];
var _newProgress = _prog+_amt;

if _newProgress >= _total
{
    _newProgress = _total;
}

ach_set_progress(_id, _newProgress, _popup)
/*else if _popup == -1 and _showprogress
{
    var _miles = _ach[? "milestones"];
    var len = array_length_1d(_miles);
    for(i=0;i<len;i++)
    {
        if _newProgress == _miles[i]
        {
            _popup = true;
            break;
        }
    }
}

_ach[? "progress"] = min(_newProgress, _total);
achievement_list[| _id] = _ach;

if _newProgress >= _total
{
    ach_award(_id);
}
else if _popup
{
    ach_queue_popup(_id);
}*/


