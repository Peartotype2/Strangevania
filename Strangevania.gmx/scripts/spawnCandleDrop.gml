///spawnCandleDrop(x, y, item)
var _x, _y, _drop
_x = argument[0];
_y = argument[1];
_drop = -1;
if argument_count == 3 {_drop = argument[2];}

if _drop != -1
{
    if _drop == item_up_whip and obj_player.whip >= 3
    {
        var randDrop = randomDrop();
        if randDrop == item_up_whip
        {
            randDrop = obj_bigheart;
        }
        instance_create(_x, _y, randDrop);
    }
    else
    {
        instance_create(_x, _y, _drop);
    }
}
else
{
    var randDrop = randomDrop();
    if randDrop == item_up_whip and obj_player.whip >= 3
    {
        randDrop = obj_bigheart;
    }
    instance_create(_x, _y, randDrop);
}
