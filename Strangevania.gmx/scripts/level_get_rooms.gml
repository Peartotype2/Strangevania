///level_get_rooms(level)
var _level = argument[0];

var _rooms = -1;

if ds_exists(_level, ds_type_map) //Check if the level data exists
{
    _rooms = _level[? "rooms"]; //Grab the array of rooms
}
else {print("(level_get_rooms) CAN'T FIND THAT LEVEL: ", _level)}

return _rooms;
