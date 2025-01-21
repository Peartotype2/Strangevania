///style_unlock(id, ach_name)

var _id = argument[0];
var _name = argument[1];
var _locked=3;

with director
{
    styleinfo[_id,_locked] = false;
    style_mark_new(_id);
    event_fire("StyleUnlocked", _id);
    event_unregister(_name + "_awarded", "skindex_"+string(_id))
}
