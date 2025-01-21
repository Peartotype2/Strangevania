///cutscene_instance_destroy(objID)
var _obj = argument[0];
if is_string(_obj) {_obj = variable_instance_get(id, "inst_"+_obj);}

with(_obj)
{
    instance_destroy();
}
cutscene_end_action();
