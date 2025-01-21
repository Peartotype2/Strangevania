///level_start(level)

var _level = argument[0];
var _rooms = _level[? "rooms"];

if room_exists(_rooms[0])
{
    if instance_exists(gamemanager) {instance_destroy(gamemanager);}
    lives = 3;
    level_current = _level;
    roomFadeTo(_rooms[0]);
}
