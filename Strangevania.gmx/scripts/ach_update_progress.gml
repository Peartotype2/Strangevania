///ach_update_progress(name/id, stat)

var _id = argument[0];
var _stat;

if stat_get("CHEATS_ENABLED")
{
    print("CHEATS PREVENTING ACHIEVEMENT PROGRESSION ["+string(_id)+"]");
    exit;
}

if argument_count > 1
{
    _stat = argument[1];
} else {
    var _ach = ach_get_info(_id);
    if is_undefined(_ach) then exit;
    _stat = _ach[? "progressstat"];
}

var _value = stat_get(_stat);
ach_set_progress(_id, _value);

