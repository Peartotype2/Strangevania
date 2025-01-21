///save_read_value(Section, Key, Default)

var _section    = string(argument[0]);
var _key        = string(argument[1]);
var _default    = argument[2];

if !ds_exists(director.savemap, ds_type_map) {exit;}

if !ds_map_exists(director.savemap, _section)
{return _default;}

var _tempmap = json_decode(director.savemap[? _section]);
var _find = ds_map_find_value(_tempmap, _key);
ds_map_destroy(_tempmap);

if is_undefined(_find) {return _default;}
else {return _find;}





