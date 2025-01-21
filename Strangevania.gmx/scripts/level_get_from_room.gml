///level_get_from_room(room)
var _room = argument[0];
var _level = -1;

var _foundRoom = false;
for(i=0;i<levelmanager.level_count;i++)
{
    var _templevel = levelmanager.level_list[| i]
    var _tempRooms = _templevel[? "rooms"];
    var _len = array_length_1d(_tempRooms)
    for (r=0; r<_len; r++)
    {
        if _tempRooms[r] == _room
        {
            _level = _templevel;
            _foundRoom = true;
            break;
        }
    }
    if _foundRoom then break;
}

if _level == -1 {print("CANT FIND LEVEL WITH THAT ROOM!"); return -1;}

return _level;
