///ach_update_unlocked_count()

var count = 0;
for(i=0;i<achievement_count;i++)
{
    var _tempach = achievement_list[| i]
    if _tempach[? "unlocked"] == true
    {
        count++;
    }
}

achievements_unlocked = count;
