///showallsongs_Execute(args)

if console.helpMessage
{
    console.commandString = "/showallsongs [true/false]";
    return "Toggles showing unheard songs in menu.";
    exit;
}

var args = argument[0];
if (array_length_1d(args) == 1)
{
    var _bool = args[0];
    if _bool == "true" then _bool = 1;
    if _bool == "false" then _bool = 0;
    _bool = real(_bool);
    
    musicmanager.showHiddenSongs = _bool;

    return iif(_bool, "All songs enabled!", "All songs disabled!");
}
else if (array_length_1d(args) == 0)
{
    var _bool = !musicmanager.showHiddenSongs;
    musicmanager.showHiddenSongs = _bool;
    
    return iif(_bool, "All songs enabled!", "All songs disabled!");
}
return "Invalid argument count.";
