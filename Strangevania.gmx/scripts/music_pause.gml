///music_pause([fadeTimeInMS])

var _time = 0; if argument_count > 0 then _time = argument[0];

audio_sound_gain(musicmanager.current_song, 0, _time);
//var _alarmTime = max( 1, ((_time / 1000) * room_speed) );
var _alarmTime = (_time / 1000) * room_speed
musicmanager.paused_song = musicmanager.current_song;
musicmanager.alarm[0] = _alarmTime;
