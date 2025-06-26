///deathmessage_register(tags, skippable, text, [icon, voiceSound, soundRate, writeSpeed, textScale, pitchMin, pitchMax, depth])
var arg_c   = argument_count;

var _tags   = argument[0];
var _skip   = argument[1];
var _text   = argument[2];

var _icon   = spr_nothing;
var _sound  = snd_voice1;
var _rate   = 2;
var _speed  = 0.5;
var _scale  = 1.25;
var _pitchMin   = 0.95;
var _pitchMax   = 1.05;
var _depth  = -2;

if arg_c > 3 then _icon  = argument[3];
if arg_c > 4 then _sound = argument[4];
if arg_c > 5 then _rate  = argument[5];
if arg_c > 6 then _speed = argument[6];
if arg_c > 7 then _scale = argument[7];
if arg_c > 8 then _pitchMin = argument[8];
if arg_c > 9 then _pitchMax = argument[9];
if arg_c > 10 then _depth = argument[10];

var msg_info = ds_map_create();
ds_map_add(msg_info, "tags", _tags);
ds_map_add(msg_info, "skippable", _skip);
ds_map_add(msg_info, "text", _text);
ds_map_add(msg_info, "icon", _icon);
ds_map_add(msg_info, "speed", _speed);
ds_map_add(msg_info, "rate", _rate);
ds_map_add(msg_info, "sound", _sound);
ds_map_add(msg_info, "scale", _scale);
ds_map_add(msg_info, "pitchMin", _pitchMin);
ds_map_add(msg_info, "pitchMax", _pitchMax);
ds_map_add(msg_info, "depth", _depth);
ds_list_add(deathmessage_manager.DeathMessage_List, msg_info);
deathmessage_manager.DeathMessage_Count++;


