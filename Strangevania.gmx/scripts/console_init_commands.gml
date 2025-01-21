///console_init_commands();

console.commandList = ds_list_create();

var _scr = script_get_name(0);
var n = 0;

//Find first command script in asset list
while string_count("_Execute", _scr) == 0
{
    _scr = script_get_name(n);
    if string_count("_Execute", _scr) == 0 {n++;}
}

//Collect all command script names
while string_count("_Execute", _scr) >= 1
{
    _scr = script_get_name(n);
    if string_count("_Execute", _scr) >= 1
    {
        var _name = string_replace(_scr, "_Execute", "");
        ds_list_add(console.commandList, _name);
        var _size = ds_list_size(console.commandList);
        print(string(n) + ": " + _name + " ["+string(_size)+"]");
    }
    n++;
}

//Setup string pages to display commands
var _maxChar    = 77; //77 chars long;
var _string     = "";
var _page       = 1;
var _cmd        = "";

var _size = ds_list_size(console.commandList)
for(var c = 0; c < _size; c++)
{
    _cmd = "/"+console.commandList[| c]+" "
    if _cmd == "/list " then _cmd = ""; //Not showing /list in the string since its a duplicate for /help
    _newString = _string + _cmd;
    if string_length(_newString) < _maxChar
    {
        _string = _newString;
        if c == (_size-1)
        {
            console.commandListPage[_page] = _string
        }
    }
    else
    {
        console.commandListPage[_page] = _string;
        _string = "";
        _page++;
        c--;
    }
}
console.commandListLastPage = _page;


print("CONSOLE COMMANDS INITIALIZED ["+string(ds_list_size(console.commandList))+"]");




