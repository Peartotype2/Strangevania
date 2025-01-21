///statadd_Execute(args)

if console.helpMessage
{
    console.commandString = "/statadd {statName} {amount}"
    return "Adds given amount to the stat. Can be negative.";
    exit;
}

var args = argument[0];
if (array_length_1d(args) == 2)
{
    var _stat = string_upper(args[0]);
    var _amt = real(args[1]);

    var _result = stat_add(_stat, _amt);
    return ("Stat changed! " + string(_result));
}
return "Invalid argument count.";
