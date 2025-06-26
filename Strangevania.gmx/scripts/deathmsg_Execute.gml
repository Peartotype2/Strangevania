///deathmsg_Execute([id OR good/bad])

if console.helpMessage
{
    console.commandString = "/deathmsg [id OR good/bad]"
    return "Displays a death message of the given type or random.";
    exit;
}

var args = argument[0];
if (array_length_1d(args) == 1)
{
    var _id = args[0];
    if is_string(_id) and (_id == "good" or _id == "bad")
    {
        ShowDeathMessage(_id);
        return "Showing a " + _id + " message..";
    }
    _id = real(_id);
    
    if _id >= deathmessage_manager.DeathMessage_Count
        or _id < -1
    {return "ID outside list range!!";}
    
    ShowDeathMessage(_id);
    
    if _id == -1 then return "Showing a random message..";
    else return "Showing message [" + string(_id) + "]";
}
else if (array_length_1d(args) == 0)
{
    ShowDeathMessage(-1);
    return "Showing a random message..";
}
return "Invalid argument count.";

