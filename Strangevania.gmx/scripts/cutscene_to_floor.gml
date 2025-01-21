///cutscene_to_floor(objID)
var _obj = argument[0];
if is_string(_obj) {_obj = variable_instance_get(id, "inst_"+_obj);}

object_to_floor(_obj);
cutscene_end_action();

