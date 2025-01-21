///ColHitEffect(border, offsetMin, OffsetMax);
//Must be placed in the collision event with the whipbox!

var offsetx = 0
var offsety = 0
if argument_count = 3
{
    offsetx = random_range(argument[1], argument[2]);
    offsety = random_range(argument[1], argument[2]);
}

var border = 1;
if argument_count = 1 {border = argument[0]}

var tipx = other.bbox_left;
if other.image_xscale == -1 {tipx = other.bbox_right};
var hitx = tipx;
if tipx < bbox_left-border hitx = bbox_left-border;
if tipx > bbox_right+border hitx = bbox_right+border;
hitx += offsetx

var _y, _yy, _yyy;
_yy = max(other.bbox_top-1,bbox_top-1)
_yyy = min(other.bbox_bottom+1,bbox_bottom+1)
_y = (_yy+_yyy)/2;
_y += offsety;
instance_create(hitx, _y, obj_hit);
