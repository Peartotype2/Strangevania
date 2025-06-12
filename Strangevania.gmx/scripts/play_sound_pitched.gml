///play_sound_pitched(sound, [minPitch, maxPitch, priority, loop]);
//Returns the ID of the sound instance

var _soundFile   = argument[0];
var _pmin        = 0.85;    if(argument_count > 1) {_pmin = argument[1]};
var _pmax        = 1.15;    if(argument_count > 2) {_pmax = argument[2]};
var _priority    = 0;       if(argument_count > 3) {_priority = argument[3]};
var _loop        = false;   if(argument_count > 4) {_loop = argument[4]};

var _finalPitch = 1;
if (argument_count == 2) {_finalPitch = _pmin;}
else {_finalPitch = random_range(_pmin, _pmax);}

//else if (argument_count >= 3) {_finalPitch = random_range(_pmin, _pmax);}

var _snd = audio_play_sound(_soundFile, _priority, _loop);
audio_sound_pitch(_snd, _finalPitch)

return _snd;
