///setting_draw_option(id, x, y, width, height)

var _id     = argument[0];
var xx      = argument[1];
var yy      = argument[2];
var ww      = argument[3];
var hh      = argument[4];

var _setting = settings.visibleList[| _id]

var _name           = _setting[? "name"];
var _displayname    = _setting[? "displayname"];
var _default        = _setting[? "default"];
var _value          = _setting[? "value"];
var _choices        = _setting[? "choices"];
var _var            = _setting[? "var"];
var _trueID         = _setting[? "id"];

if _selected
{
    //_yoff += hh;
    //hh = h_off;
}

//background
var bgr_c = c_black;
if _selected
{
    bgr_c = c_dkgray
    draw_sprite_stretched_ext(spr_white_pixel, 0, xx-32, yy, ww+64, hh,
        bgr_c, 0.65*menu_alpha);
}
else
{
    draw_sprite_stretched_ext(spr_white_pixel, 0, xx, yy, ww, hh,
        bgr_c, 0.65*menu_alpha);
}

var _tCol = c_maroon;
var _sCol = c_maroon;
    
if _selected
{
    draw_sprite_stretched_ext(spr_white_pixel, 0, xx-32, yy, ww+64, hh,
        c_white, 0.35*menu_alpha);
    _tCol = c_red;
    _sCol = c_maroon;
}

/*var _even = (_id % 2 == 0)
if _even 
{
    _tCol = merge_colour(_tCol, c_white, 0.2);
    _sCol = merge_colour(_sCol, c_white, 0.2);
}*/
    
//text
draw_set_valign(fa_middle);
draw_set_halign(fa_left);
draw_set_font(font_menu);

/*draw_text_transformed_colour(xx+2, yy+(hh/2), _displayname, 0.75, 0.75, 0,
    c_white, c_white, c_ltgray, c_ltgray, menu_alpha);*/
    
draw_text_transformed_colour(xx+2+1, yy+(hh/2)+1, _displayname, 3, 3, 0,
    _sCol, _sCol, _sCol, _sCol, menu_alpha);
draw_text_transformed_colour(xx+2, yy+(hh/2), _displayname, 3, 3, 0,
    _tCol, _tCol, c_orange, c_orange, menu_alpha);

draw_set_halign(fa_right);
var _val = _choices[_value];
var _valColor = c_white;
if _val == "ON" then _valColor = c_lime;
if _val == "Disabled" or _val == "Off" then _valColor = c_gray;

/*draw_text_transformed_colour(xx+ww-2, yy+(hh/2), string(_val), 0.5, 0.5, 0,
c_white, c_white, c_white, c_white, menu_alpha);*/
draw_text_transformed_colour(xx+ww-2, yy+(hh/2), string(_val), 2, 2, 0,
_valColor, _valColor, _valColor, _valColor, menu_alpha);
    
draw_set_valign(fa_middle);
draw_set_halign(fa_center);
