///UpdatePlayerSprite()
if image_freeze then exit;
//Animation
image_xscale = facing;
mask_index = -1;

if attack or weapon {
    image_speed = 1;
    var _anim = PlayerAttackAnim();
    sprite_index = _anim;
    if crouch {mask_index = spr_player_crouch;} //If crouching while attacking, make sure to always use the crouching hitbox.
}
else if knocked {
    if knockonce {
        sprite_index = spr_player_knockback;
    } else {
        sprite_index = spr_player_dead;
        image_index = 0;
        image_speed = 0;
    }
}
else
{
    if !place_meeting( x, y+1, obj_wall) and !onStair {
        //sprite_index = spr_player_jump;
        //image_speed = 0;
        if sign(vsp) > 0 {sprite_index = spr_player;}
        else {sprite_index = spr_player_jump;}
    } else {
        //image_speed = 1;
        if move == 0 {//hsp == 0 {
            image_speed = 0;
            if falling or crouch {sprite_index = spr_player_crouch;}
            else if onStair {
                if hsp == 0 {
                    image_index = (sprite_get_number(spr_player_stepup)-1);
                    if facing == -1 and stairAscend == STAIR_RIGHT {
                        sprite_index = spr_player_stepup;
                        ascending = true;
                    } else if facing == 1 and stairAscend == STAIR_LEFT {
                        sprite_index = spr_player_stepup;
                        ascending = true;
                    } else {
                        sprite_index = spr_player_stepdown;
                        ascending = false;
                    }
                } else {
                    //sprite_index = spr_player_step;
                    image_speed = 1;
                    if facing == -1 and stairAscend == STAIR_RIGHT
                    {sprite_index = spr_player_stepup;}
                    else if facing == 1 and stairAscend == STAIR_LEFT
                    {sprite_index = spr_player_stepup;}
                    else
                    {sprite_index = spr_player_stepdown;}
                }
            }
            else if stairLatching and hsp != 0
            {
                image_speed = 1;
                sprite_index = spr_player_run;
            }
            else
            {
                //sprite_index = spr_player;
                image_speed = 1;
                sprite_index = spr_player_idle;
            }
        }
        else
        {
            image_speed = 1;
            //image_index = 0;
            if falling or crouch {sprite_index = spr_player_crouch;}
            else if !onStair {sprite_index = spr_player_run;}
            else if stairLatching and hsp != 0 {sprite_index = spr_player_run;}
            else if onStair{
                //sprite_index = spr_player_step;
                if facing == -1 and stairAscend == STAIR_RIGHT
                {sprite_index = spr_player_stepup;}
                else if facing == 1 and stairAscend == STAIR_LEFT
                {sprite_index = spr_player_stepup;}
                else
                {sprite_index = spr_player_stepdown;}
            }
            else
            {
                sprite_index = spr_player_idle;
            }
        }
    }
}
