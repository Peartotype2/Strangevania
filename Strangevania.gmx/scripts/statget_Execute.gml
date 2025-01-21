///statget_Execute(args)

if console.helpMessage
{
    console.commandString = "/statget {statName}"
    return "Displays the value of given stat.";
    exit;
}

var args = argument[0];
if (array_length_1d(args) == 1)
{
    var _stat = string_upper(args[0]);

    var _result = stat_get(_stat);
    if is_undefined(_result) then return "Unknown stat.";
    return _result;
}
return "Invalid argument count.";
