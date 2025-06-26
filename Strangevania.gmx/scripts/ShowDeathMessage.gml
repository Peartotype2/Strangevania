///ShowDeathMessage(id OR tags)
var _msgtype = argument[0];

var _msg = GetDeathMessage(_msgtype);

var _tags       = _msg[? "tags"];
var _skip       = _msg[? "skippable"];
var _text       = _msg[? "text"];
var _icon       = _msg[? "icon"];
var _speed      = _msg[? "speed"];
var _rate       = _msg[? "rate"];
var _scale      = _msg[? "scale"];
var _sound      = _msg[? "sound"];
var _pitchMin   = _msg[? "pitchMin"];
var _pitchMax   = _msg[? "pitchMax"];
var _depth      = _msg[? "depth"];

print("MESSAGE TAGS: ", _tags);
var _cutscene   = cutscene_info_init();
_cutscene = scene_add_action(_cutscene, cutscene_wait, 1.25);
_cutscene = scene_add_action(_cutscene, cutscene_show_dialog, _skip, _text, _icon, _speed, _rate, _sound, _pitchMin, _pitchMax, _scale, _depth);
_cutscene = scene_add_action(_cutscene, cutscene_wait, 3);
_cutscene = scene_add_action(_cutscene, cutscene_fadeout_dialog);

cutscene_create(_cutscene);
