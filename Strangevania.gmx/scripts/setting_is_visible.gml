///setting_is_visible(id)

var __id = argument[0];

for(i=0;i<settings.visibleCount;i++)
{
    if settings.visibleList[| i] != 0
    {
        var _set = settings.visibleList[| i];
        if _set[? "id"] == __id
        {
            return true;
        }
    }
}

return false;
