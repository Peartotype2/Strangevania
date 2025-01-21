///style_is_unlocked(id)

var _id = argument[0];
var _unlocked = director.styleinfo[_id,style.locked];

return _unlocked;
