///cutscene_move_actor(objID, x, y, relative?, speed)

var _obj        = argument[0];
var _x          = argument[1];
var _y          = argument[2];
var _relative   = argument[3];
var _speed      = argument[4];

if is_string(_obj) {_obj = variable_instance_get(id, "inst_"+_obj);}

if x_dest == -1
{
    if !_relative
    {
        x_dest = _x;
        y_dest = _y;
    }
    else
    {
        x_dest = _obj.x + _x;
        y_dest = _obj.y + _y;
    }
}

var xx = x_dest;
var yy = y_dest;

with(_obj)
{
    if(point_distance(x, y, xx, yy) >= _speed)
    {
        var dir = point_direction(x, y, xx, yy);
        var ldirx = lengthdir_x(_speed, dir);
        var ldiry = lengthdir_y(_speed, dir);
        
        x += ldirx;
        y += ldiry;
    }
    else
    {
        x = xx;
        y = yy;
        
        with(other)
        {
            x_dest = -1;
            y_dest = -1;
            cutscene_end_action();
        }
    }
}
