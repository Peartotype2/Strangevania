///scene_add_action(cutscene_info, script, args..)
var _infoarray = argument[0];

var _returnarray;
_returnarray[0] = argument[1];

var _args;
for (i=0; i<argument_count-2; i++)
{
    _args[i] = argument[i+2];
}

if argument_count == 2 then _returnarray[1] = false;
else _returnarray[1] = _args;

var info_len = array_length_1d(_infoarray);

if _infoarray[0] == -1
{
    _infoarray[0] = _returnarray;
}
else
{
    _infoarray[info_len] = _returnarray;
}

return _infoarray;





