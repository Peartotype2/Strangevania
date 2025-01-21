///kill_Execute
if console.helpMessage
{
    console.commandString = "/kill"
    return "Kills the player if it exists.";
    exit;
}

if instance_exists(player)
{
    player.hp = 0;
}
return "Killing player...";
