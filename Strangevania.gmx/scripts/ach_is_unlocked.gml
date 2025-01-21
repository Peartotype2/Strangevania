///ach_is_unlocked(name)

var _name = argument[0];

var _ach = ach_get_info(_name);
if is_undefined(_ach) then exit;

var _result = _ach[? "unlocked"]

return _result;
