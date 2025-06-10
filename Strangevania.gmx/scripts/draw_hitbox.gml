///draw_hitbox([color, alpha, outline?, object])

var _hitboxColor    = c_red if(argument_count > 0) {_hitboxColor    = argument[0];}
var _hitboxAlpha    = 1     if(argument_count > 1) {_hitboxAlpha    = argument[1];}
var _hitboxOutline  = true  if(argument_count > 2) {_hitboxOutline  = argument[2];}
var _hitboxObject   = id    if(argument_count > 3) {_hitboxObject   = argument[3];}

with _hitboxObject
{
    if _hitboxAlpha != 1 draw_set_alpha(_hitboxAlpha);
    
    draw_rect_col(bbox_left+1,  bbox_top+1, bbox_right-1,   bbox_bottom-1,  c_red,  true)
    draw_rect_col(bbox_left,    bbox_top,   bbox_right,     bbox_bottom,    c_red,  true)
    
    if _hitboxAlpha != 1 draw_set_alpha(1);
}
