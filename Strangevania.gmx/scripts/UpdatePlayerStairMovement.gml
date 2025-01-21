//StairLatch
if (key_up or key_down) and instance_place(x, y, obj_stairparent)
 and !onStair and !falling and !attack and !weapon and !crouch and !jumped
 and !knocked and place_meeting( x, y+1, obj_wall) //and move == 0
{
    var inst = instance_place(x, y, obj_stairparent);
    if key_down and !inst.top and !stairLatching {exit;}

    hsp = 0;
    vsp = 0;
    stairStepFirst = true;
    if inst.type == STAIR_START
    {
        stairDirH = inst.stairDirH;
        stairDirV = inst.stairDirV;
        //x = inst.x//+(8*sign(stairDirH));
        //y = inst.y//+(8*sign(stairDirV));
        stepX = inst.x+(8*sign(stairDirH));
        stepY = inst.y+(8*sign(stairDirV));
    }
    else
    {
        stairDirH = inst.otherObject.stairDirH;
        stairDirV = inst.otherObject.stairDirV;
        //x = inst.x//+(-8*sign(stairDirH));
        //y = inst.y//+(-8*sign(stairDirV));
        stepX = inst.x+(-8*sign(stairDirH));
        stepY = inst.y+(-8*sign(stairDirV));
    }
    
    if stairDirV == STAIR_UP
    {
        if stairDirH == STAIR_RIGHT
        {
            stairAscend = STAIR_RIGHT;
        }
        else
        {
            stairAscend = STAIR_LEFT;
        }
    }
    else if stairDirV == STAIR_DOWN
    {
        if stairDirH == STAIR_RIGHT
        {
            stairAscend = STAIR_LEFT;
        }
        else
        {
            stairAscend = STAIR_RIGHT;
        }
    }
    
    //onStair = true;
    stairID = inst;
    stairLatching = true;
    if alarm[11] <= 0 then alarm[11] = 45;
}

if stairLatching
{
    var inst = instance_place(x, y, obj_stairparent);

    if inst != noone
    {
        if x != inst.x
        {
            if x < inst.x
            {
                var sep = abs(x - inst.x)
                if sep < stepSpeed*2 {hsp = sep;}
                else {hsp = stepSpeed*2}
            }
            if x > inst.x 
            {
                var sep = abs(x - inst.x)
                if sep < stepSpeed*2 {hsp = -sep;}
                else {hsp = -stepSpeed*2}
            }
        }
        else
        {
            hsp = 0;
            onStair = true;
            stairLatching = false;
        }
    }
}

//StairMovement
if onStair
{
    var inst = instance_place(x, y, obj_stairparent);
    if inst != noone
    {
        if inst == stairID or inst == stairID.otherObject
        {
            if inst.type == STAIR_START
            {
                stairDirV = inst.stairDirV;
                stairDirH = inst.stairDirH;
            }
            else
            {
                stairDirV = inst.otherObject.stairDirV;
                stairDirH = inst.otherObject.stairDirH;
            }
            //if inst.type == STAIR_START
            if x = inst.x and y = inst.y and stairStepFirst == false
            {
                /*if stairStepFirst
                {
                    stairCanMove = true;
                }
                else
                {*/
                    onStair = false;
                    stairCanMove = false;
                //}
            }
        }
    }
    
    if x = stepX and y = stepY and stairStepFirst
    {
        stairCanMove = true;
    }

    var screenShift = false;
    var goingUp = false;
    var goingDown = false;
    if (bbox_top < obj_camera.y+24) or (bbox_bottom > obj_camera.y+viewh)
    {
        //show_debug_message("SCREEN Y TIER SHIFT"); //DEBUG
        //show_debug_message(string(y) + " / " + string(stepY))
        //show_debug_message(string((viewy+(viewh/2))))
        goingUp = (y < (viewy+(viewh/2)));
        goingDown = !goingUp;
        //if goingUp show_debug_message("Going UP");
        //if goingDown show_debug_message("Going DOWN");
        screenShift = true;
    }
    
    if screenShift
    {
        if hsp == 0 and vsp == 0
        {
            var teleportAmount = 6;
            var stepAmount = 6;
            
            if (stairTeleYDir == 1 and goingDown) or (stairTeleYDir == -1 and goingUp)
            {
                stepY += 8*stepAmount*stairTeleYDir;
                y += 8*teleportAmount*stairTeleYDir;
                
                stepX += 8*stepAmount*stairTeleXDir;
                x += 8*teleportAmount*stairTeleXDir;
                
                obj_camera.camblockLeft = 0;
                obj_camera.camblockRight = 0;
                viewx = x-(vieww/2)
                
                if sign(stairTeleXDir) == -1
                {camblockCheckLeft(); print("CHECK LEFT!");}
                else {camblockCheckRight(); print("CHECK RIGHT!");}
                //viewy = y-(viewh/2)
            }
            
            if instance_exists(obj_fade)
            {
                with obj_fade
                {
                    if stairFade
                    {
                        fadein = true;
                        inc *= -1;
                        if alpha == 0 then instance_destroy();
                    }
                }
            }
        }
        else if settings.stairfade
        {
            with instance_create(5, 5, obj_fade)
            {
                stairFade = true;
                fadein = false;
                inc = 0.33;//0.25;
            }
        }
    }
    
    
    if !stairStep and onStair and move != 0 and stairCanMove and !attack and !weapon and !screenShift
    {
        //if !stairStepFirst
        //{
            stepX += move * 8;//(8*sign(stairDirH));
            stepY += move * (8*sign(stairDirV) * sign(stairDirH));
            stairTeleYDir = iif(stepY > y, 1, -1);
            stairTeleXDir = iif(stepX > x, 1, -1);
        //}
        //if stairStepFirst {stepY -= 1;}
        stairStep = true;
        alarm[4] = room_speed/4;//room_speed/6;  DEBUGGING 30 FPS FIX SPEEDS
        event_fire("StairStepClimbed");
        
        /*if screenShift
        {
            var teleYDir = iif(stepY > y, 1, -1);
            var teleXDir = iif(stepX > x, 1, -1);
            var teleportAmount = 6;
            var stepAmount = 6;
            
            if (stepY > y and goingDown) or (stepY < y and goingUp)
            {
                stepY += 8*stepAmount*teleYDir;
                y += 8*teleportAmount*teleYDir;
                
                stepX += 8*stepAmount*teleXDir;
                x += 8*teleportAmount*teleXDir;
            }
        }*/
    }
    
    if x != stepX
    {
        if x < stepX
        {
            var sep = abs(x - stepX)
            if sep < stepSpeed {hsp = sep;}
            else {hsp = stepSpeed}
        }
        if x > stepX 
        {
            var sep = abs(x - stepX)
            if sep < stepSpeed {hsp = -sep;}
            else {hsp = -stepSpeed}
        }
    }
    else
    {
        hsp = 0;
        //if stairStepFirst { stairCanMove = true; }
    }
    
    if y != stepY
    {        
        if y < stepY
        {
            var sep = abs(y - stepY)
            if sep < stepSpeed {vsp = sep;}
            else {vsp = stepSpeed}
        }
        if y > stepY 
        {
            var sep = abs(y - stepY)
            if sep < stepSpeed {vsp = -sep;}
            else {vsp = -stepSpeed}
        }
    }
    else
    {
        vsp = 0;
        //if stairStepFirst { stairCanMove = true; }
    }
}
