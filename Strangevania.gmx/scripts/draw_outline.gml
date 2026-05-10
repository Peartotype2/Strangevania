///draw_outline(x, y, w, h, thickness, color, alpha)

var xx          = argument[0];
var yy          = argument[1];
var ww          = argument[2];
var hh          = argument[3];
var TH          = argument[4];
var color       = argument[5];
var alpha       = argument[6];

/////////////////////////
//Top Left to Top Right//
draw_sprite_ext(spr_white_pixel, 0, xx, yy, ww, TH,
0, color, alpha);

//Top Left to Bot Left
//
draw_sprite_ext(spr_white_pixel, 0, xx, yy+TH, TH, hh-(TH*2),
0, color, alpha);

/*Top Right to Bot Right//
                        */
draw_sprite_ext(spr_white_pixel, 0, xx+ww-TH, yy+TH, TH, hh-(TH*2),
0, color, alpha);

//Bot Left to Bot Right//
/////////////////////////
draw_sprite_ext(spr_white_pixel, 0, xx, yy+hh-TH, ww, TH,
0, color, alpha);



