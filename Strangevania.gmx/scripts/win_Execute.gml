///win_Execute
if console.helpMessage
{
    console.commandString = "/win"
    return "Completes the current level.";
    exit;
}

if instance_exists(player) and level_current != -1
{
    game_complete_level(level_current);
    return "Finishing level...";
}
return "Not in a level!";
