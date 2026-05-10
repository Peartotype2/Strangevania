///ach_queue_popup(name/id)
if !settings.achpopup exit;

var _name = argument[0];
var _ach = ach_get_info(_name);
if is_undefined(_ach) then exit;

if _ach[? "unlocked"] == false and settings.achpopup == 1 exit;

ds_queue_enqueue(achievement_queue, _name);
