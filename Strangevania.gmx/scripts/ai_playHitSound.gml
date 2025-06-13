///ai_playHitSound([damage, HPtuned?])

var _damage         = player.whip;  if argument_count > 0 {_damage = argument[0];}
var _HPtuned        = true;         if argument_count > 1 {_HPtuned = argument[1];}
var _pitchVariation = 0.025;
var _pitchMin       = 0.75;
var _pitchMax       = 1.25;
var _pitch          = 1;

if _HPtuned and maxhp > _damage
{
    var _HPPercentage = hp/maxhp;
    _pitch = lerp(_pitchMax, _pitchMin, _HPPercentage);
}

return play_sound_pitched(hitSound, _pitch-_pitchVariation, _pitch+_pitchVariation)


