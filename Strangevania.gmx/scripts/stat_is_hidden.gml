///stat_is_hidden(statName)

var _stat = argument[0];
if is_real(_stat)
{
    _stat = stattracker.statList[| _stat]
}
var _bool = false;

var _len = ds_list_size(stattracker.hiddenStats);

var i = 0; repeat(_len)
{
    var _tempname = stattracker.hiddenStats[| i];
    if _tempname == _stat then _bool = true;
    i++;
}

return _bool;
