///setmoney_Execute(args)

if console.helpMessage
{
    console.commandString = "/setmoney {amount}"
    return "Sets your amount of money.";
    exit;
}

var args = argument[0];
if (array_length_1d(args) == 1)
{
    if string_letters(args[0]) != "" then return "Not a number.";
    var _amt = real(args[0]);
    if !is_real(_amt) then return "Not a number.";
    
    global.money = _amt;

    return ("Money changed!");
}
return "Invalid argument count.";
