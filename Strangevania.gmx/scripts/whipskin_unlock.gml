///whipskin_unlock(id, ach_name)

var _id = argument[0];
var _name = argument[1];

with director
{
    whipskin_info[_id,style.locked] = false;
    whipskin_mark_new(_id);
    event_fire("WhipskinUnlocked", _id);
    event_unregister(_name + "_awarded", "whipskin_"+string(_id))
}
