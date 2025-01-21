///music_unpause([fadeTimeInMS])

var _time = 0; if argument_count > 0 then _time = argument[0];

audio_resume_sound(musicmanager.paused_song);
audio_sound_gain(musicmanager.paused_song, musicmanager.max_volume, _time);
musicmanager.paused_song = noone;

