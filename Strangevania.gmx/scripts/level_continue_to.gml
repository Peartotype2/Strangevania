///level_start(level)

var _level = argument[0];
var _rooms = _level[? "rooms"];
//lives = 3;
level_current = _level;
//gamemanager.levelContinue = true;
roomFadeTo(_rooms[0]);
