///showglobalvar_Execute(args)

if console.helpMessage
{
    console.commandString = "/showglobalvar {variable}"
    return "Displays the current value of a global variable.";
    exit;
}

var args = argument[0];
if (array_length_1d(args) == 1)
{
    var _var = args[0];
    if !variable_global_exists(_var) then return "Variable does not exist!"
    
    var _value = string(variable_global_get(_var));
    
    return ("global."+_var+" = "+_value);
}
return "Invalid argument count.";
