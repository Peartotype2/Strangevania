///UpdatePlayerHCol()
//mask_index = spr_player;
//Horizontal Collision
horizontalCollision = false;
if place_meeting( x+hsp, y, obj_wall) and !onStair and !stairLatching
{
    horizontalCollision = true;
    while !place_meeting(x+sign(hsp), y, obj_wall)
    {
        x = x + sign(hsp)
    }
    hsp = 0
}
//mask_index = -1;
