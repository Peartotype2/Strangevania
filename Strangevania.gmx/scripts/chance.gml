///chance(percent DECIMAL or WHOLE)

// Returns true or false depending on RNG
// ex: 
//      Chance(0.7);    -> Returns true 70% of the time
// If we type 70 instead of 0.70 it will correct it.
//      Chance(70);     -> Returns true 70% of the time

var _percent = argument0;
if _percent >= 1 {_percent /= 100;}
return (random(1) < _percent);
