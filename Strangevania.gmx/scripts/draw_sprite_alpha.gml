///draw_sprite_alpha(sprite, subimg, x, y, alpha)

var _spr = argument[0];
var _sub = argument[1];
var _x = argument[2];
var _y = argument[3];
var _a = argument[4];

draw_sprite_ext(_spr, _sub, _x, _y, 1, 1, 0, c_white, _a)
