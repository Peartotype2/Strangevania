///level_register(name, displayname, rooms[], [parScore, parTime, unlocked, rating, rank, score, time])
var arg_c = argument_count;

var _id, _name, _displayname, _rooms, _parScore, _parTime, _unlocked, _rating, _rank, _score, _time;
with levelmanager
{
    _id             =   levelmanager.level_count;
    _name           =   argument[0];
    _displayname    =   argument[1];
    _rooms          =   argument[2];
    _parScore       =   1000;
    _parTime        =   120;
    _unlocked       =   false;
    _rating         =   -1;
    _rank           =   -1;
    _score          =   0;
    _time           =   INCOMPLETE_LEVEL;
    if(arg_c > 3) {_parScore = argument[3]};
    if(arg_c > 4) {_parTime  = argument[4]};
    if(arg_c > 5) {_unlocked = argument[5]};
    if(arg_c > 6) {_rating   = argument[6]};
    if(arg_c > 7) {_rank     = argument[7]};
    if(arg_c > 8) {_score    = argument[8]};
    if(arg_c > 9) {_time     = argument[9]};
    
    var level_info = ds_map_create();
    ds_map_add(level_info, "id", _id);
    ds_map_add(level_info, "name", _name);
    ds_map_add(level_info, "displayname", _displayname);
    ds_map_add(level_info, "rooms", _rooms);
    ds_map_add(level_info, "parScore", _parScore);
    ds_map_add(level_info, "parTime", _parTime);
    ds_map_add(level_info, "unlocked", _unlocked);
    ds_map_add(level_info, "rank", _rank);
    ds_map_add(level_info, "score", _score);
    ds_map_add(level_info, "time", _time);
    ds_list_add(level_list, level_info);
    level_count++;
}
