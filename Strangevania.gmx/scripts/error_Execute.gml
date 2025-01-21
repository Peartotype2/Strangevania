///error_Execute(args)

if console.helpMessage
{
    console.commandString = "/error {message} {abort}"
    return "Throws a fake error. WARNING: if abort is true game will close.";
    exit;
}

var args = argument[0];
if (array_length_1d(args) == 2)
{
    var _str = args[0];
    if _fatal == "true" then _fatal = 1;
    if _fatal == "false" then _fatal = 0;
    var _fatal = real(args[1]);
    
    show_error(_str, _fatal);
    
    return "Error test.";
}
return "Invalid argument count.";
