///reload_Execute

if console.helpMessage
{
    console.commandString = "/reload"
    return "Reloads to the game init screen. Does not restart the level.";
    exit;
}

console._oldks = keyboard_string;
console.open = false;
roomFadeTo(init)
music_stop_all();
print("Game reload command executed.");

return "Reloading game...";



