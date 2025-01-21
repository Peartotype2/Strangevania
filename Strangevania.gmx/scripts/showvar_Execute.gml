///showvar_Execute(args)

if console.helpMessage
{
    console.commandString = "/showvar {object} {variable}"
    return "Displays the current value of a variable of a specific object.";
    exit;
}

var args = argument[0];
if (array_length_1d(args) == 2)
{
    if args[0] == "player" then args[0] = "obj_player"
    var _obj = asset_get_index(args[0]);
    if _obj == -1 then return "Invalid object!"
    _obj = _obj.id
    
    var _var = args[1];
    if !variable_instance_exists(_obj, _var) then return "Invalid variable!"
    
    var _value = string(variable_instance_get(_obj, _var));
    var _objName = args[0];//object_get_name(_obj.object_index);
    
    return (_objName+"."+_var+" = "+_value);
}
return "Invalid argument count.";
