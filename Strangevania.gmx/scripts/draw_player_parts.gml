///draw_player_parts(upperSprite, lowerSprite)

var _upper = argument[0];
var _lower = argument[1];

var torsoLeft = 0;
var torsoTop = 0;
var torsoW = 32;
var torsoH = 16;

var legLeft = 0;
var legTop = 16;
var legW = 32;
var legH = 16;

var yoff = 0;

if _lower == spr_player_whipC
{
    legTop = 24;
    legH = 8;
    yoff = 8;
}

var p = player;

var px = p.sprite_xoffset;
var py = p.sprite_yoffset

draw_sprite_part_ext(_upper, p.image_index, torsoLeft, torsoTop, torsoW, torsoH, p.x-px, p.y-py+yoff,
    p.image_xscale, p.image_yscale, p.image_blend, p.image_alpha);
    
draw_sprite_part_ext(_lower, p.image_index, legLeft, legTop, legW, legH, p.x-px, p.y+yoff,
    p.image_xscale, p.image_yscale, p.image_blend, p.image_alpha);

