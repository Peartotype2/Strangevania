///draw_object_tiled()
var _xscale = clamp(image_xscale, 0, 1)
var _yscale = clamp(image_yscale, 0, 1)
var _xfrac = frac(image_xscale);
var _yfrac = frac(image_yscale);
var _spr = sprite_index;
var _w = sprite_get_width(_spr);
var _h = sprite_get_height(_spr);

for(i=0; i<image_xscale; i++){
    for(j=0; j<image_yscale; j++){
        //_xs = _xscale;
        //_ys = _yscale;
        _xs = iif(_xfrac, _xfrac, _xscale)
        _ys = iif(_yfrac, _yfrac, _yscale)
        draw_sprite_ext(_spr, 0, x+(i*_w), y+(j*_h),
                            _xs, _ys, image_angle, image_blend, image_alpha);
    }
}

/*for(i=0; i<image_xscale; i++){
    _xs = _xscale;
    _ys = _yscale;
    if i+1+_xfrac >= image_xscale and _xfrac != 0
    {
        _xs = _xfrac;
        //_ys = _yfrac;
    }
    for(j=0; j<image_yscale; j++){
        _xs = _xscale;
        _ys = _yscale;
        if j+1+_yfrac >= image_yscale and _yfrac != 0
        {
            //_xs = _xfrac;
            _ys = _yfrac;
        }
        draw_sprite_ext(_spr, 0, x+(i*sprite_get_width(_spr)), y+(j*sprite_get_height(_spr)),
                            _xs, _ys, image_angle, image_blend, image_alpha);
    }
}*/
