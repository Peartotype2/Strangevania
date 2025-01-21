///gameover_Execute

if console.helpMessage
{
    console.commandString = "/gameover"
    return "Removes all lives and kills the player.";
    exit;
}

if instance_exists(player)
{
    lives = 0;
    player.hp = 0;
}
return "Game ended...";
