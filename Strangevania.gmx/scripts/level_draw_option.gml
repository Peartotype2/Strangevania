///level_draw_option(id, x, y, width, height)

var _id     = argument[0];
var xx      = argument[1];
var yy      = argument[2];
var ww      = argument[3];
var hh      = argument[4];

var _level = levelmanager.level_list[| _id]

var _name           = _level[? "name"];
var _displayname    = _level[? "displayname"];
var _unlocked       = _level[? "unlocked"];
var _rating         = _level[? "rating"];
var _score          = _level[? "score"];
var _time           = _level[? "time"];

if _selected
{
    _yoff += hh;
    hh = h_off;
}

//background
var bgr_c = c_black;
if _selected {bgr_c = c_dkgray;}
//if !_unlocked {bgr_c = c_black;}
draw_sprite_stretched_ext(spr_white_pixel, 0, xx, yy, ww, hh,
    bgr_c, 0.65*menu_alpha);
/*if _selected
{
    draw_sprite_stretched_ext(spr_white_pixel, 0, xx, yy, ww, hh,
        c_white, 0.15*menu_alpha);
}*/
    
//text
draw_set_valign(fa_middle);
draw_set_halign(fa_left);
draw_set_font(font_menu);

var hh_half = iif(_selected, 4, 2);
draw_text_transformed_colour(xx+2, max(yy+(hh/hh_half), yy+(string_height(_displayname)/2)-1), _displayname, 0.75, 0.75, 0,
    c_white, c_white, c_ltgray, c_ltgray, menu_alpha);
    
if _selected
{
    //Draw letter grade for rating
    if _rating > 0
    {
        var _rank = level_calc_grade(_rating)
        var _sprScale = 0.25;
        var _sprW = sprite_get_width(spr_lettergrade)*_sprScale;
        var _sprH = sprite_get_width(spr_lettergrade)*_sprScale;
        var _sprHscale = percent(h_off, 0, 16);
        draw_sprite_ext(spr_lettergrade, _rank, xx+ww-(_sprW/2), yy+(_sprH/2)-16+h_off, _sprScale, _sprScale*_sprHscale,
         0, c_white, (0.55*percent(h_off, 8, 16)*menu_alpha))
        //print("RATING: ", _rating, " RANK: ", _rank); //DEV DEBUG REMOVE LATER
    }

    //draw_set_font(font_hud);
    var _score_scale = 0.50;
    var hstr = "HIGHSCORE";
    var hxoff = (string_width(hstr)*_score_scale) + 2;
    draw_text_transformed_colour(xx+1, yy+((hh/4)*3)+1, hstr, _score_scale, _score_scale, 0,
    c_orange, c_orange, c_yellow, c_yellow, menu_alpha);

    
    //draw_set_font(font_hud)
    draw_text_transformed_colour(xx+1+hxoff, yy+((hh/4)*3)+1, string(_score), _score_scale, _score_scale, 0,
    c_white, c_white, c_white, c_white, menu_alpha);
    //draw_set_font(font_menu)
    
    draw_set_halign(fa_right)
    if _time == INCOMPLETE_LEVEL
    {
        var _timestr = "XX:XX"
    }
    else
    {
        var _timestr = SecondsToTime(_time);
        _timestr = string_delete(_timestr, 1, 3) // Remove the hours section
    }
    draw_text_transformed_colour(xx+ww-1, yy+((hh/4)*3)+1, _timestr, 0.55, 0.55, 0,
    c_white, c_white, c_white, c_white, menu_alpha);
    //draw_set_font(font_menu);
}

if !_unlocked
{
    bgr_c = c_black
    draw_sprite_stretched_ext(spr_white_pixel, 0, xx, yy, ww, hh,
        bgr_c, 0.65*menu_alpha);
}
    
draw_set_valign(fa_middle);
draw_set_halign(fa_center);
