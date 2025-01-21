///music_play(songName, [stopOtherSongs?, loop?])

var _song = argument[0];
var _stop = true; if argument_count > 1 _stop = argument[1];
var _loop = true; if argument_count > 2 _loop = argument[2];

var _paused = musicmanager.paused_song;
var _cur = musicmanager.current_song;

if _cur != noone
{
    musicmanager.last_song = _cur;
}

if _paused != noone //If there is a song paused, unpause it before changing
{
    music_unpause();
}

if _stop then music_stop_all();

if !audio_is_playing(_song)
{
    audio_play_sound(_song, 1, _loop)
    audio_sound_gain(_song, musicmanager.max_volume, 0);
}
else
{
    print("ERROR: TRIED TO PLAY DUPLICATE SONG AUDIO ("+string(_song)+")");
}
musicmanager.current_song = _song;
event_fire(sound_get_name(_song)+"_PLAYED");
