///ach_award(name/id)

var _arg = argument[0];

if stat_get("CHEATS_ENABLED")
{
    print("CHEATS PREVENTING ACHIEVEMENT PROGRESSION ["+string(_arg)+"]");
    exit;
}

var _ach = ach_get_info(_arg);
if is_undefined(_ach) {exit;}
var _unlocked = _ach[? "unlocked"];
var _name = _ach[? "name"];

if _unlocked == true or is_undefined(_unlocked) {exit;}
event_fire(_name + "_awarded", _name)
ach_set_unlocked(_arg, true);
//ach_show_popup(_arg);
ach_queue_popup(_arg);
