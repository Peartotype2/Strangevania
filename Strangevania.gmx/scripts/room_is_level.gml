///room_is_level(room)

var _room = room;
if argument_count > 0 then _room = argument[0];

if string_count("level", room_get_name(_room)) >= 1
{
    return true;
}

return false;
