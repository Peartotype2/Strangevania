///viewh_Execute(args)

if console.helpMessage
{
    console.commandString = "/viewh {value}"
    return "Sets the height of the view. (DANGEROUS)";
    exit;
}

var args = argument[0];
if (array_length_1d(args) == 1)
{
    var _amt = args[0];
    var _old = viewh;
    viewh = _amt;
    return string(_old)+" -> "+string(_amt);
}
return "Invalid argument count.";
