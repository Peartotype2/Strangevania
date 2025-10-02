///forcequit_Execute

if console.helpMessage
{
    console.commandString = "/forcequit"
    return "DOES NOT SAVE and forces game to close.";
    exit;
}

director.exitWithoutSaving = true;
game_end();
return "Closing Game...";
