///drop_table_add(tableID, drop, chanceWeight)

var _table = argument[0];
var _drop = argument[1];
var _chance = argument[2];

var _map = ds_map_create();

ds_map_add(_map, "drop", _drop);
ds_map_add(_map, "chance", _chance);

ds_list_add(_table, _map);
//ds_list_insert(_table, _chance, _map);
//ds_list_sort(_table, false);
//ds_map_destroy(_map);
