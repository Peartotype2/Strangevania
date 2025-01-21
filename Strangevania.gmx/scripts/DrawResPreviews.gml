///DrawResPreviews()

var _prevoffset = 80;

var _rid = director.res_id-1,
if _rid < 0 then _rid = director.res_max;
var _w = string(director.res_array[_rid,0])
var _h = string(director.res_array[_rid,1])
var _prevtext = (_w + "x" + _h)
var _prevx = (menuX+xoff) - _prevoffset;
var _nextx = (menuX+xoff) + _prevoffset;

var _prevscale = 0.75*_scale;
var _prevalpha = 0.5;
var _prevbgralpha = 0.25;

_rid = director.res_id+1
if _rid > director.res_max then _rid = 0;
_w = string(director.res_array[_rid,0])
_h = string(director.res_array[_rid,1])
var _nexttext = (_w + "x" + _h)

//////prev text

var _len1 = string_width(_prevtext)
var _height1 = string_height(_prevtext)
draw_sprite_ext(spr_blackround, 0, _prevx, menuY+yoff + op_space*i,
 (_len1/32+(8/32))*_prevscale, (_height1/32+(4/32))*_prevscale, 0, c_white, _prevbgralpha);

draw_text_transformed_colour(_prevx+1, menuY+yoff + op_space*i+1, _prevtext, //Shadow
 _prevscale, _prevscale, 0, _sCol, _sCol, _sCol, _sCol, _prevalpha);
draw_text_transformed_colour(_prevx, menuY+yoff + op_space*i, _prevtext, //Main text
 _prevscale, _prevscale, 0, _tCol, _tCol, _tCol2, _tCol2, _prevalpha);
 
//////next text
 
var _len1 = string_width(_nexttext)
var _height1 = string_height(_nexttext)
draw_sprite_ext(spr_blackround, 0, _nextx, menuY+yoff + op_space*i,
 (_len1/32+(8/32))*_prevscale, (_height1/32+(4/32))*_prevscale, 0, c_white, _prevbgralpha);

draw_text_transformed_colour(_nextx+1, menuY+yoff + op_space*i+1, _nexttext, //Shadow
 _prevscale, _prevscale, 0, _sCol, _sCol, _sCol, _sCol, _prevalpha);
draw_text_transformed_colour(_nextx, menuY+yoff + op_space*i, _nexttext, //Main text
 _prevscale, _prevscale, 0, _tCol, _tCol, _tCol2, _tCol2, _prevalpha);
