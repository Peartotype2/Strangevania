///cutscene_cam_lerp(true/false, amount)

var _bool = argument[0];
var _amt = obj_camera.lerpDefault;
if argument_count > 1 {_amt = argument[1];}

with obj_camera
{
    lerpAmount = _amt
    camLerp = _bool;
}

cutscene_end_action();

