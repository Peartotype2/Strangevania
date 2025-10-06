///ach_update_unlocked_count()
var count = 0;
ds_list_clear(achievement_unlocked_list);
for(i=0;i<achievement_count;i++)
{
    var _tempach = achievement_list[| i]
    if _tempach[? "unlocked"] == true
    {
        count++;
        ds_list_add(achievement_unlocked_list, i);
    }
}

achievement_unlocked_count = count;

ach_set_progress("achwhore", count)
