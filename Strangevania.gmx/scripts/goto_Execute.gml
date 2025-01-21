///goto_Execute

if console.helpMessage
{
    console.commandString = "/goto {roomName}"
    return "Loads to given room. (DANGEROUS)";
    exit;
}

var args = argument[0];
if (array_length_1d(args) == 1)
{
    var rm = asset_get_index(args[0]);
    if !room_exists(rm) then return ("Can't find room: " + args[0]);
    
    if string_count("level", args[0]) >= 1 //If room is a level
    {
        if instance_exists(gamemanager) {instance_destroy(gamemanager);}
        lives = 3;
        level_current = level_get_from_room(rm);
    }
    
    roomFadeTo(rm);
    return "Changing rooms.";
}
return "Invalid argument count.";
