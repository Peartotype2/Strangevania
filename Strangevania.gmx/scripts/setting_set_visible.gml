///setting_set_visible(id, true/false)

var __id = argument[0];
var __visible = argument[1];
var __setting = settings.list[| __id];

if __visible
{
    if setting_is_visible(__id) == false
    {
        ds_list_add(settings.visibleList, __setting);
        //ds_list_set(settings.visibleList,__id,__setting);
    }
}
else
{
    for(i=0;i<settings.visibleCount;i++)
    {
        var _set = settings.visibleList[| i];
        if _set[? "id"] == __id
        {
            ds_list_delete(settings.visibleList, i)
            break;
        }
    }
}

settings.visibleCount = ds_list_size(settings.visibleList);
