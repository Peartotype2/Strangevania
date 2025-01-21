///stat_draw_option(id, x, y, width, height)

var _id     = argument[0];
var xx      = argument[1];
var yy      = argument[2];
var ww      = argument[3];
var hh      = argument[4];

var _name = stattracker.statList[| _id]
var _hidden = stat_is_hidden(_id);
//var _stat = stattracker.statMap[? _name]

var _displayname      = stattracker.displayNames[_id];
//var _default        = _stat[? "default"];
var _value            = stat_get_display_value(_name);//stat_get(_name);

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
var _tCol2 = c_orange;
var _sCol = c_black;

if _hidden
{
    _tCol = c_silver;
    _tCol2 = c_gray;
    _sCol = c_black;
}
    
if _selected
{
    draw_sprite_stretched_ext(spr_white_pixel, 0, xx-32, yy, ww+64, hh,
        c_white, 0.35*menu_alpha);
    _tCol = c_red;
    _sCol = c_maroon;
    if _hidden
    {
        _tCol = c_white;
        _sCol = c_dkgray;
    }
}
    
//text
draw_set_valign(fa_middle);
draw_set_halign(fa_left);
draw_set_font(font_menu);

/*draw_text_transformed_colour(xx+2, yy+(hh/2), _displayname, 0.75, 0.75, 0,
    c_white, c_white, c_ltgray, c_ltgray, menu_alpha);*/
    
draw_text_transformed_colour(xx+2+1, yy+(hh/2)+1, _displayname, 3, 3, 0,
    _sCol, _sCol, _sCol, _sCol, menu_alpha);
draw_text_transformed_colour(xx+2, yy+(hh/2), _displayname, 3, 3, 0,
    _tCol, _tCol, _tCol2, _tCol2, menu_alpha);

draw_set_halign(fa_right);
/*draw_text_transformed_colour(xx+ww-2, yy+(hh/2), string(_val), 0.5, 0.5, 0,
c_white, c_white, c_white, c_white, menu_alpha);*/
draw_text_transformed_colour(xx+ww-2, yy+(hh/2), string(_value), 2, 2, 0,
c_white, c_white, c_white, c_white, menu_alpha);
    
draw_set_valign(fa_middle);
draw_set_halign(fa_center);
