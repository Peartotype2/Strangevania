///save_write_value(Section, Key, Value)

var _section    = string(argument[0]);
var _key        = string(argument[1]);
var _value      = argument[2];

if !ds_exists(director.savemap, ds_type_map)
{director.savemap = ds_map_create();}

var _tempmap = -1;
if !ds_map_exists(director.savemap, _section)
{
    _tempmap = ds_map_create();
}
else
{
    _tempmap = json_decode(director.savemap[? _section]);
}


//ds_map_add(_tempmap, _key, _value);
_tempmap[? _key] = _value;
director.savemap[? _section] = json_encode(_tempmap);
ds_map_destroy(_tempmap);





