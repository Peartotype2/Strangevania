///UpdateAudioVolume()

audio_master_gain(director.mastervolume);

audio_group_set_gain(ag_music, (director.musicvolume*director.musicmult), 0);
audio_group_set_gain(ag_music_mainmenu, (director.musicvolume*director.musicmult), 0);

audio_group_set_gain(ag_sfx, director.sfxvolume, 0);

var _voicevolume = director.sfxvolume*0.5;
audio_group_set_gain(ag_voices, _voicevolume, 0);
