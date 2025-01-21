///ach_show_popup(name/id)

var _arg = argument[0];
var _ach = ach_get_info(_arg);

var _am = achievementmanager;
_am.show_ach = _ach;
_am.anim_y = sprite_get_height(ach_unlocked_border)+1;
_am.anim_flip = false;
if _am.alarm[0] > 0 then _am.alarm[0] = -1;
_am.show_anim = true;
