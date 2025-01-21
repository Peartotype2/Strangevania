///ach_register(name, displayname, icon, desc, showProgress, progressTotal, progressStat, milestones, progress, unlocked)
var argcount = argument_count;

var _new_ach = ds_map_create();

var _name           =   argument[0]     //ex: "holybbq";
var _displayname    =   argument[1]     //ex: "Holy BBQ";
var _icon           =   argument[2]     //ex: ach_icon_holybbq
var _desc           =   argument[3]     //ex: "Cook up some BBQ with holy fire."
var _showProgress   =   false;
var _progressTotal  =   1;
var _progressStat   =   "NONE";
var _milestones;
_milestones[0] = 1;
var _progress       =   0;
var _unlocked       =   false;

if argcount >= 5 then {_showProgress = argument[4]}
if argcount >= 6 then {_progressTotal = argument[5]}
if argcount >= 7 then {_progressStat = argument[6]}
if argcount >= 8 then {_milestones = argument[7]}
if argcount >= 9 then {_progress = argument[8]}
if argcount >= 10 then {_unlocked = argument[9]}
//if argument_count = 5 then {_unlocked = argument[4]} //Set the unlocked status if its provided

var _id = achievement_count;

//Add this info to a new achievment map
ds_map_add(_new_ach, "name", _name)
ds_map_add(_new_ach, "displayname", _displayname)
ds_map_add(_new_ach, "desc", _desc)
ds_map_add(_new_ach, "icon", _icon)
ds_map_add(_new_ach, "showprogress", _showProgress)
ds_map_add(_new_ach, "progress", _progress)
ds_map_add(_new_ach, "progresstotal", _progressTotal)
ds_map_add(_new_ach, "progressstat", _progressStat)
ds_map_add(_new_ach, "milestones", _milestones)
ds_map_add(_new_ach, "unlocked", _unlocked)
ds_map_add(_new_ach, "id", _id)

//Add this new achievment to the master list under its 'name'
ds_list_add(achievement_list, _new_ach);
achievement_count++;

if _progressStat != "NONE"
{
    var _ev = _progressStat + "_updated";
    event_register_script(_ev, _name, ach_update_progress, _id, _progressStat);
}

print("Achievement " + _name + "(" + string(_progress) + "/" + string(_progressTotal) + ") registered at [" + string(_id) + "]");

