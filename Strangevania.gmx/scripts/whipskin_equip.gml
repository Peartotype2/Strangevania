///whipskin_equip(id)

var _id = argument[0];

director.whipskin_index = _id;
event_fire("WhipskinEquipped", _id);
whipskin_mark_seen(_id);

/*var _pos = ds_list_find_index(director.newwhip_list, _id)
if _pos != -1
{
    ds_list_delete(director.newwhip_list, _pos)
}*/
