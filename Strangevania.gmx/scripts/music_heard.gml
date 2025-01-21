///music_heard(song)
//Returns if a song has been heard before

var _song = argument[0];

return stat_get(sound_get_name(_song)+"_HEARD");
