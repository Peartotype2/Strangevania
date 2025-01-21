///UpdatePlayerVCol()
//mask_index = spr_player;
//Vertical Collision
verticalCollision = false;
if place_meeting( x, y+vsp, obj_wall) and !onStair and !stairLatching
{
    verticalCollision = true;
    var _obj = instance_place( x, y+vsp, obj_wall);
    if false//_obj and y > _obj.bbox_top
    {
        /*if y+vsp < _obj.bbox_top then exit;
        else
        {
            y = _obj.bbox_top+1
            vsp = 0;
        }*/
    }
    else
    {
        while !place_meeting(x, y+sign(vsp), obj_wall)
        {
            y = y + sign(vsp)
        }
        vsp = 0
        if jumped and bbox_bottom <= _obj.bbox_top
        {
            jumped = false;
            jumpdir = 0;
        }
    }
}
//mask_index = -1;
