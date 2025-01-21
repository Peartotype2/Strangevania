///style_equip(id)

var _id = argument[0];

director.skin_index = _id;
event_fire("StyleEquipped", _id);
style_mark_seen(_id);
/*var _pos = ds_list_find_index(director.newskin_list, _id)
if _pos != -1
{
    ds_list_delete(director.newskin_list, _pos)
}*/
