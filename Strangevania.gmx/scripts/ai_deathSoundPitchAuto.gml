///ai_deathSoundPitchAuto()

var _toughness = ceil(maxhp / 3)
var _newPitch = 1.3;
_newPitch -= (_toughness*0.125);
_newPitch = clamp(_newPitch, 0.55, 1.4);

deathSoundPitchMin = _newPitch-0.1;
deathSoundPitchMax = _newPitch+0.1;
