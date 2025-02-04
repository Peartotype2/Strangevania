///object_to_floor(_obj, [PixelsAboveFloor])
var _obj = argument[0];
var _aboveFloor = 1; if argument_count > 1 then _aboveFloor = argument[1];

if !InsideRoom(_obj.x, 1) {print("OBJECT TO FLOOR FAILED OUTSIDE ROOM WALLS!!"); exit;}
if !instance_exists(_obj) {exit;}

var _offset = 1;

with _obj
{
    var _floorSteps = 0;
    var _floorStepsMax = 30;
    var _offsetInc = 4;
    while !place_meeting( x, y+_offset, obj_solid)
    {
        _offset += _offsetInc;
        _floorSteps++;
        if !InsideRoom(x, y+_offset) or _floorSteps > _floorStepsMax
        {
            print("OBJECT TO FLOOR BROKE WHILE LOOP!! (steps: ", _floorSteps, ")");
            //break;
            exit;
        }
    }
    var _floorObj = instance_place( x, y+_offset, obj_solid);
    if !instance_exists(_floorObj)
    {
        show_error("_floorObj in object_to_floor script DID NOT EXIST!!", false);
        print("_floorObj in object_to_floor script DID NOT EXIST!!");
        exit;
    }
    
    //y += _offset-_aboveFloor;
    y = (_floorObj.bbox_top-_aboveFloor)-sprite_yoffset;
}
