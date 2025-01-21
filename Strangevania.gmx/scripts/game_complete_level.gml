///game_complete_level(level, [nextLevel, score, timeInSeconds, hearts])

var _level = argument[0];
var _nextLevel = -1;
if argument_count > 1 {_nextLevel = argument[1];}
var _lid = _level[? "id"];

if _nextLevel == -1 and (_lid+1) < levelmanager.level_count
{
    _nextLevel = levelmanager.level_list[| _lid+1];
}

if _nextLevel != -1
{
    var _tempRooms = _nextLevel[? "rooms"];
    var _nextRoom = _tempRooms[0];
    level_set_unlocked(_nextLevel, true);
}
else
{
    var _nextRoom = intro;
}

var _score      = gamemanager.points;
var _timeLeft   = gamemanager.stageTime;
var _timeTotal  = gamemanager.seconds;
var _hearts     = gamemanager.hearts;
if argument_count > 2 then _score = argument[2];
if argument_count > 3 then _time = argument[3];
if argument_count > 4 then _hearts = argument[4];

//var _level = levelmanager.level_list[| _id]

print("DEBUGSCORE: " + string(_score));
with instance_create(0, 0, rewardmenu)
{
    level       = _level;
    hearts      = _hearts;
    timeTotal   = _timeTotal;
    timeLeft    = _timeLeft;
    scoreamount = _score;
    targetRoom  = _nextRoom;
    targetLevel = _nextLevel;
}
roomFadeTo(level_rewardroom)
music_fade_out(500)

