///level_calc_rating(level, score, time)

var level = argument[0];
var newScore = argument[1];
var newTime  = argument[2];

var parScore = level[? "parScore"];
var parTime  = level[? "parTime"];

var scoreRatio = (newScore/parScore);
var timeRatio  = (parTime/newTime);

var ratingNumber = (scoreRatio * timeRatio)

//print("LEVEL RATING: ", ratingNumber); //DEV DEBUG REMOVE LATER
return ratingNumber;
