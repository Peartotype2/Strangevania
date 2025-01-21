///style_mark_seen(id)

var _id = argument[0];

var _pos = ds_list_find_index(director.newskin_list, _id)
if _pos != -1
{
    ds_list_delete(director.newskin_list, _pos)
}
