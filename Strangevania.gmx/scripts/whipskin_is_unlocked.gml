///whipskin_is_unlocked(id)

var _id = argument[0];
var _unlocked = director.whipskin_info[_id,style.locked];

return _unlocked;
