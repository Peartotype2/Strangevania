///stat_register(name, displayname, default, [hidden?]);
var arg_c = argument_count;

var __name = argument[0];
var __displayname = argument[1];
var __default = argument[2];
var _hidden = false;
if arg_c > 3 then _hidden = argument[3];

ds_map_add(stattracker.statMap, __name, __default);
ds_list_add(stattracker.statList, __name);
ds_list_add(eventhandler.noListenerBlacklist, __name + "_updated");
var _len = ds_list_size(stattracker.statList);
stattracker.displayNames[_len-1] = __displayname;

if _hidden
{
    stattracker.hiddenStats[stattracker.hiddenCount] = __name;
    stattracker.hiddenCount++;
}

//print("HIDDEN COUNT: " + string(stattracker.hiddenCount));

