///ach_set_unlocked(name/id, unlocked)

var _name = argument[0];
var _bool = argument[1];

var _ach = ach_get_info(_name);
if is_undefined(_ach) then exit;
var _id = _ach[? "id"];
_name = _ach[? "name"];

//If achievement has a stat tied to it's progression
// unregister from listening every time the stat is updated
// since we don't care anymore because the achievement is unlocked.
var _stat = _ach[? "progressstat"];
if _stat != "NONE"
{
    event_unregister(_stat + "_updated", _name)
}

_ach[? "unlocked"] = _bool;
achievement_list[| _id] = _ach;
ach_update_unlocked_count()
