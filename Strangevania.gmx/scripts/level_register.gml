///level_register(name, displayname, rooms[], [unlocked, rank, score, time])
var arg_c = argument_count;

var _id, _name, _displayname, _rooms, _unlocked, _rank, _score, _time;
with levelmanager
{
    _id             =   levelmanager.level_count;
    _name           =   argument[0];
    _displayname    =   argument[1];
    _rooms          =   argument[2];
    _unlocked       =   false;
    _rank           =   0
    _score          =   0
    _time           =   INCOMPLETE_LEVEL
    if(arg_c > 3) {_unlocked = argument[3]};
    if(arg_c > 4) {_rank = argument[4]};
    if(arg_c > 5) {_score = argument[5]};
    if(arg_c > 6) {_time = argument[6]};
    
    var level_info = ds_map_create();
    ds_map_add(level_info, "id", _id);
    ds_map_add(level_info, "name", _name);
    ds_map_add(level_info, "displayname", _displayname);
    ds_map_add(level_info, "rooms", _rooms);
    ds_map_add(level_info, "unlocked", _unlocked);
    ds_map_add(level_info, "rank", _rank);
    ds_map_add(level_info, "score", _score);
    ds_map_add(level_info, "time", _time);
    ds_list_add(level_list, level_info);
    level_count++;
}
