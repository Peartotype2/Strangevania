///UpdatePlayerDirection()

// Change direction
if !attack and !knocked and !weapon //If not in the middle of an attack or knockback animation
{
    if move != 0 facing = (move*-1);//image_xscale = (move*-1);
}
