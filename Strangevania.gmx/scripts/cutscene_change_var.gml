///cutscene_change_var(objID, var_as_string, value)

var _obj = argument[0];
if is_string(_obj) {_obj = variable_instance_get(id, "inst_"+_obj);}
var _var = argument[1];
var _val = argument[2];

with(_obj)
{
    variable_instance_set(id, _var, _val)
}

cutscene_end_action();
