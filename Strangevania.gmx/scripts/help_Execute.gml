///help_Execute(args)

if console.helpMessage
{
    console.commandString = "/help [command OR page]"
    return "Lists all commands or how to use specific command.";
    exit;
}

var args = argument[0];
if (array_length_1d(args) == 0)
{   
    var _lastPage = console.commandListLastPage;
    var _page = 1;
    var _string = console.commandListPage[_page];
    console.commandString = "/help ["+string(_page)+"/"+string(_lastPage)+"]"
    return _string;
}
else if (array_length_1d(args) == 1)
{
    var _input = args[0];
    
    if string_length(string_digits(_input)) > 0 and string_length(string_letters(_input)) < 1
    {_input = real(_input);}
    
    if is_real(_input)
    {
        var _lastPage = console.commandListLastPage;
        var _page = clamp(_input, 1, _lastPage);
        var _string = console.commandListPage[_page];
        console.commandString = "/help ["+string(_page)+"/"+string(_lastPage)+"]"
        return _string;
    }
    
    var _cmd = ds_list_find_index(console.commandList, _input);
    if _cmd == -1 then return "Unknown command.";
    _cmd = console.commandList[| _cmd];

    var _script = asset_get_index(_cmd + "_Execute");
    if !script_exists(_script)
    {
        show_error("ERROR: Command script ("+_cmd+"_Execute) doesn't exist!", false);
        return "ERROR: Command script ("+_cmd+"_Execute) doesn't exist!";
    }
    
    console.helpMessage = true;
    var _usage = script_execute(_script);
    console.helpMessage = false;
    return _usage;
}
return "Invalid argument count.";
