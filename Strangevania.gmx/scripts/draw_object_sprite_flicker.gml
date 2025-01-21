///draw_object_sprite_flicker([objID])
//ObjID defaults to whatever object is calling the script

var _obj = id;
if argument_count > 0 then _obj = argument[1];

with _obj
{
    var overlapping = false;
    var _inst = instance_place(x, y, entity_parent);
    if place_meeting(x, y, entity_parent)// and _inst != _obj
    {
        overlapping = true;
    }
    
    if overlapping or chance(0.05)
    {
        var skipAllInvisChance = 0.35;
    
        var _spriteXoff     = sprite_get_xoffset(sprite_index);
        var _spriteYoff     = sprite_get_yoffset(sprite_index);
        
        var _totalWidth     = sprite_get_width(sprite_index);
        var _totalHeight    = sprite_get_height(sprite_index);
        var _xSlices        = ceil(_totalWidth / 8);
        var _ySlices        = ceil(_totalHeight / 8);
        var _totalSlices    = _xSlices * _ySlices;
        
        var _maxInvis   = 2;
        var _minInvis   = 0;
        var _goalInvis  = irandom_range(_minInvis, _maxInvis);
        var _totalInvis = 0;
        var _invisSlices = array_create(1);
        _invisSlices[0] = -1;
        
        if instance_exists(_inst)
        {
            if _inst.object_index == obj_candle
            {
                skipAllInvisChance = 0.10;
                //round(distance_to_point(_inst.x+_spriteXoff, _inst.y+_spriteYoff) / 8)
                _candleSliceX = round(distance_to_point(_inst.x+_spriteXoff, y) / 8)
                _candleSliceY = round(distance_to_point(x, _inst.y+_spriteYoff) / 8)
                //print(string(_candleSliceX) + " / " + string(_candleSliceY));
                var _candleSliceID = 0;
                _candleSliceID += ((_candleSliceX)*_ySlices);
                _candleSliceID += (_candleSliceY)+choose(-1, 1);
                _candleSliceID = clamp(_candleSliceID, 0, _totalSlices);
                _invisSlices[_totalInvis] = _candleSliceID;
                _maxInvis--; //_maxInvis = max(_maxInvis--, 1);
                _totalInvis++;
                
                //_goalInvis = 0;// DEBUG REMOVE LATER
            }
        }
        
        if chance(skipAllInvisChance) {_goalInvis = 0;}
        
        var _pickedInvisSlices = array_create(1);
        _pickedInvisSlices[0] = -1;
        while _totalInvis < _goalInvis
        {
            var t = _totalInvis;
            var _randomSlice = irandom_range(0, _totalSlices);
            
            var _duplicateInvis = false;
            for(r = 0; r < array_length_1d(_pickedInvisSlices); r++)
            {
                if _randomSlice == _pickedInvisSlices[r] {_duplicateInvis = true; break;}
            }
            
            if !_duplicateInvis
            {
                _pickedInvisSlices[t] = _randomSlice;
                _invisSlices[t] = _randomSlice;
                _totalInvis++;
            }
        }
        
        var xscaleSign = sign(image_xscale);
        var yscaleSign = sign(image_yscale);
        
        var itotal = 0;
        for(var ix = 0; ix < _xSlices; ix++)
        {
            for(var iy = 0; iy < _ySlices; iy++)
            {
                var skipSlice = false;
                var _len = array_length_1d(_invisSlices);
                for (in = 0; in < _len; in++)
                {
                    if itotal == _invisSlices[in]
                    {
                        skipSlice = true;
                        break;
                    }
                }
            
                if !skipSlice
                {
                    var _sx = ix*8;
                    var _sy = iy*8;
                    var _sw = 8;
                    var _sh = 8;
                    
                    var _drawx = x-(_spriteXoff)+_sx;
                    if !xscaleSign
                    {
                        var _originToEdge = (_totalWidth - _spriteXoff);
                        _drawx = (x+_originToEdge)-_sx;
                    }
                    
                    var _drawy = y-(_spriteYoff)+_sy;
                    if !yscaleSign
                    {
                        var _originToEdge = (_totalHeight - _spriteYoff);
                        _drawy = (y+_originToEdge)-_sy;
                    }
                    
                    //print(string(_sx) + " / " + string(_sy));
                    
                    draw_sprite_part_ext(sprite_index, image_index, _sx, _sy, _sw, _sh,
                        _drawx,
                        _drawy,
                        image_xscale, image_yscale, image_blend, image_alpha);
                    
                }
                itotal++;
            }
        }
                                    
    }
    else
    {
        draw_self();
    }
}
