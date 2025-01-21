///music_fade_to(songName, timeInMS, [loop?])

var _newsong = argument[0];
var _time = argument[1];
var _loop = true; if argument_count > 2 _loop = argument[2];

if musicmanager.current_song == noone or musicmanager.current_song == _newsong
{
    music_fade_in(_newsong, _time, _loop);
    exit;
}

if musicmanager.current_song != noone
{
    musicmanager.new_song = _newsong;
    audio_sound_gain(musicmanager.current_song, 0, _time); //Fade out old song over time
    ds_list_add(musicmanager.stop_list, musicmanager.current_song);
}
else
{
    //musicmanager.current_song = _newsong;
}

if !audio_is_playing(_newsong)
{
    audio_play_sound(_newsong, 1, _loop); //Play new song
    audio_sound_gain(_newsong, 0, 0); //Instantly make its vol 0
    audio_sound_gain(_newsong, musicmanager.max_volume, _time); //Fade its volume up over time
}
else
{
    print("ERROR: TRIED TO PLAY DUPLICATE SONG AUDIO ("+string(_newsong)+")");
}
event_fire(sound_get_name(_newsong)+"_PLAYED");

