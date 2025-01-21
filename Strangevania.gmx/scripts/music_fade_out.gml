///music_fade_out(timeInMS, [song])

var _time = argument[0];
var _song = musicmanager.current_song; if argument_count > 1 then _song = argument[1];

audio_sound_gain(_song, -0.01, _time); //Fade out current song over time
ds_list_add(musicmanager.stop_list, _song);

