///clear_Execute(args)

if console.helpMessage
{
    console.commandString = "/clear"
    return "Clears the previously used commands.";
    exit;
}

ds_list_clear(console.inputLog);
console.logSize = 0;

return "Cleared log.";
