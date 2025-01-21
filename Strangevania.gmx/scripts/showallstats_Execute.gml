///showallstats_Execute(args)

if console.helpMessage
{
    console.commandString = "/showallstats [true/false]";
    return "Toggles showing hidden stats in menu.";
    exit;
}

var args = argument[0];
if (array_length_1d(args) == 1)
{
    var _bool = args[0];
    if _bool == "true" then _bool = 1;
    if _bool == "false" then _bool = 0;
    _bool = real(_bool);
    
    director.showHiddenStats = _bool;

    return iif(_bool, "All stats enabled!", "All stats disabled!");
}
else if (array_length_1d(args) == 0)
{
    var _bool = !director.showHiddenStats;
    director.showHiddenStats = _bool;
    
    return iif(_bool, "All stats enabled!", "All stats disabled!");
}
return "Invalid argument count.";
