///budha_Execute
if console.helpMessage
{
    console.commandString = "/budha"
    return "Prevents the player from going below 1 hp.";
    exit;
}

if instance_exists(gamemanager)
{
    gamemanager.budha = !gamemanager.budha;
    var _toggle = iif(gamemanager.budha, "ON!", "OFF!");
    return ("Budha mode turned " + _toggle);
}
return "Can't find game manager object! Must be in a level!";
