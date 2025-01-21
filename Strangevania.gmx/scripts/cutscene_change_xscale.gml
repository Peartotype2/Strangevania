///cutscene_change_xscale(objID, xscale)

var _obj = argument[0];
if is_string(_obj) {_obj = variable_instance_get(id, "inst_"+_obj);}

if argument_count > 1
{
    var _xs =  argument[1];
    
    with _obj
    {
        image_xscale = _xs;
    }
}
else
{
    with _obj
    {
        image_xscale = -image_xscale;
    }
}

cutscene_end_action();

