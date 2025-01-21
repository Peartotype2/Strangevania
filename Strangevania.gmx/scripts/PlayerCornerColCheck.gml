///PlayerCornerColCheck()

if !horizontalCollision and !verticalCollision and !onStair and !stairLatching
{
    //var vCol = place_meeting( x, y+vsp, obj_wall);
    //var hCol = place_meeting( x+hsp, y, obj_wall);
    if place_meeting( x+hsp, y+vsp, obj_wall)
    {
        while !place_meeting(x+sign(hsp), y+vsp, obj_wall)
        {
            x = x + sign(hsp)
        }
        hsp = 0
        print("PREVENTED CORNER STUCK!");
    }
}

