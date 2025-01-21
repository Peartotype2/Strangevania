///run_Execute(args)

if console.helpMessage
{
    console.commandString = "/run {script} {arguments..}"
    return "Runs any script outside of normal commands. (DANGEROUS)";
    exit;
}

var args = argument[0];
var script = asset_get_index(args[0]);
if script == -1 {return "Invalid script.";}
var data;
var len = array_length_1d(args)-1;
if len < 1 {return "Not enough arguments."}
var i = 0; repeat(len)
{
    var _cur = args[i+1]
    
    if (string_char_at(_cur, 1) == "@")
    {
        _cur = string_delete(_cur, 1, 1);
        var _asset = asset_get_index(_cur);
        if _asset != -1 then _cur = _asset;
        else {return "Invalid Asset!"}
        print(_cur);
    }
    else if (string_count("\#", _cur) >= 1) or string_letters(_cur) == ""
    {
        _cur = string_digits(_cur)
        _cur = real(_cur);
        print(_cur);
    }
    
    data[i] = _cur;
    i++;
}

script_execute_alt(script, data)

return "Careful! Executing.";
