///object_to_floor(_obj)
var _obj = argument[0];

var _offset = 1;

with _obj
{
    var _floorSteps = 0;
    var _floorStepsMax = 30;
    while !place_meeting( x, y+_offset, obj_solid)
    {
        _offset++
        _floorSteps++;
        if !InsideRoom(x, y+_offset) or _floorSteps > _floorStepsMax
        {
            print("OBJECT TO FLOOR BROKE WHILE LOOP!!!!");
            break;
            exit;
        }
    }
    
    y += _offset-1;
}
