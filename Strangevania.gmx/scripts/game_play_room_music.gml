///game_play_room_music([fadeType, timeInMS])
if !instance_exists(room_info)
{
    print("COULDN'T FIND ROOM_INFO");
    exit;
}
var arg_c = argument_count;

var _fade = "fadeTo";
var _time = 1000;
if arg_c > 0 then _fade = argument[0];
if arg_c > 1 then _time = argument[1];

var _music = room_info.room_music;

if _music == -1 then _music = snd_none;

switch(_fade)
{
    case "fadeIn": music_fade_in(_music, _time); break;
    case "fadeTo": music_fade_to(_music, _time); break;
    case "none": music_play(_music); break;
    //default: music_fade_to(_music, _time);
}
