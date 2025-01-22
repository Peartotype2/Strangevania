///setglobalvar_Execute(args)

if console.helpMessage
{
    console.commandString = "/setglobalvar {variable} {value}"
    return "Sets the value of a GLOBAL variable. (DANGEROUS)";
    exit;
}

var args = argument[0];
if (array_length_1d(args) == 2)
{ 
    var _var = args[0];
    if !variable_global_exists(_var) then return "Variable does not exist!"
    
    var _value = args[1];
    //var _digits = string_digits(_value);
    if string_is_real(_value) //string_length(_digits) == string_length(_value)
    {
        _value = real(_value);
    }
    
    variable_global_set(_var, _value);

    return ("Global Var changed!");
}
return "Invalid argument count.";
