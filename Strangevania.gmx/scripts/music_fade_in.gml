///music_fade_in(songName, timeInMS, [loop?])

var _song = argument[0];
var _time = argument[1];
var _loop = true; if argument_count > 2 _loop = argument[2];

var _paused = musicmanager.paused_song;
if _paused != noone //If there is a song paused, unpause it before changing
{
    music_unpause();
}

music_stop_all();

audio_stop_sound(_song);

audio_play_sound(_song, 1, _loop); //Play new song
audio_sound_gain(_song, 0, 0); //Instantly make its vol 0
audio_sound_gain(_song, musicmanager.max_volume, _time); //Fade its volume up over time
event_fire(sound_get_name(_song)+"_PLAYED");
musicmanager.current_song = _song;

