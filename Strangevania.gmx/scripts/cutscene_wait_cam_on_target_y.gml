///cutscene_wait_cam_on_target(true/false)

var _bool = argument[0];
var _target = obj_camera.target;
var _ontarget = (obj_camera.y == _target.y)

if _ontarget == _bool
{
    cutscene_end_action();
}
