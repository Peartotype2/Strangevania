///view_Execute(args)

if console.helpMessage
{
    console.commandString = "/view {width} {height}"
    return "Sets the width and height of the view. (DANGEROUS)";
    exit;
}

var args = argument[0];
if (array_length_1d(args) == 2)
{
    var _w = args[0];
    var _h = args[1];
    var _old = "("+string(vieww)+","+string(viewh)+")";
    var _new = "("+string(_w)+","+string(_h)+")"
    vieww = _w;
    viewh = _h;
    return _old+" -> "+_new;
}
return "Invalid argument count.";
