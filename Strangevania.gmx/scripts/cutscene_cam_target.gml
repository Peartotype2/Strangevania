///cutscene_cam_target(objID)

var _obj = argument[0];
if is_string(_obj) {_obj = variable_instance_get(id, "inst_"+_obj);}

with obj_camera
{
    target = _obj;
}

cutscene_end_action();

