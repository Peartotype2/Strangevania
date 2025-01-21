///restart_Execute

if console.helpMessage
{
    console.commandString = "/restart"
    return "Restarts the whole game. Not the level.";
    exit;
}

console._oldks = keyboard_string;
console.open = false;
roomFadeTo(init)
music_stop_all();
return "Restarting game...";
