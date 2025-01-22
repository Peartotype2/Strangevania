///setvar_Execute(args)

if console.helpMessage
{
    console.commandString = "/setvar {object} {variable} {value}"
    return "Sets variable of a specific object. (DANGEROUS)";
    exit;
}

var args = argument[0];
if (array_length_1d(args) == 3)
{
    if args[0] == "player" then args[0] = "obj_player"
    var _obj = asset_get_index(args[0]);
    if _obj == -1 then return "Invalid object!"
    _obj = _obj.id
    
    var _var = args[1];
    if !variable_instance_exists(_obj, _var) then return "Invalid variable!"
    
    var _value = args[2];
    //var _digits = string_digits(_value);
    if string_is_real(_value) //string_length(_digits) == string_length(_value)
    {
        _value = real(_value);
    }
    
    variable_instance_set(_obj, _var, _value);

    return ("Var changed!");
}
return "Invalid argument count.";
