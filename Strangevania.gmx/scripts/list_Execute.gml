///list_Execute

if console.helpMessage
{
    console.commandString = "/list [page]"
    return "Lists all commands.";
    exit;
}

var args = argument[0];
if (array_length_1d(args) == 0)
{
    return help_Execute(args);
}
else if (array_length_1d(args) == 1)
{
    if string_length(string_digits(args[0])) > 0 and string_length(string_letters(args[0])) < 1
    {
        return help_Execute(args);
    }
    else
    {
        return "Invalid argument."
    }
}
return "Invalid argument count.";
