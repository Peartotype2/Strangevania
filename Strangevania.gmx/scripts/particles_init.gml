///particles_init()

//Spine Blood///////////
var _p = part_type_create();
part_type_shape(_p, pt_shape_square);
part_type_life(_p, 15, 30);
part_type_alpha2(_p, 1, 0.5);
part_type_colour2(_p, c_red, c_maroon);
part_type_colour_mix(_p, c_red, c_maroon);
part_type_speed(_p, 4, 16, 0, 2);
part_type_direction(_p, 0, 180, 0, 0);
part_type_gravity(_p, 4, 270);
part_type_sprite(_p, spr_blood, 0, 0, 0);
part_type_size(_p, 1, 2, -0.25, 0);
global.ptSpineBlood = _p;
//////////////////////

//Spear wind///////////
var _p = part_type_create();
part_type_shape(_p, pt_shape_line);
part_type_life(_p, 15, 30);
part_type_alpha2(_p, 0.6, 0.2);
part_type_colour2(_p, c_white, c_gray);
//part_type_colour_mix(_p, c_ltgray, c_gray);
part_type_speed(_p, 6/*16*/, 8/*24*/, 0, 4);
part_type_size(_p, 1, 1, -0.1, 0);
part_type_sprite(_p, spr_spearwind, true, true, true);
part_type_direction(_p, 180, 180, 0, 0);
global.ptSpearWindLeft = _p;

var _p = part_type_create();
part_type_shape(_p, pt_shape_line);
part_type_life(_p, 15, 30);
part_type_alpha2(_p, 0.6, 0.2);
part_type_colour2(_p, c_white, c_gray);
//part_type_colour_mix(_p, c_ltgray, c_gray);
part_type_speed(_p, 6/*16*/, 8/*24*/, 0, 4);
part_type_size(_p, 1, 1, -0.1, 0);
part_type_sprite(_p, spr_spearwind, true, true, true);
part_type_direction(_p, 0, 0, 0, 0);
global.ptSpearWindRight = _p;
//////////////////////


