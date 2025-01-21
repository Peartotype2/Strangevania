///ObjectInsideView(objID, margin)

var obj = argument[0];
var margin = 0;
if argument_count > 1 then margin = argument[1];

var vx = viewx - margin;
var vy = viewy - margin;
var vx2 = vx + vieww + (margin*2); // Margin doubled to account for margin-
var vy2 = vy + viewh + (margin*2); //-taken away from vx and vy initially

if obj.bbox_right > vx and obj.bbox_left < vx2
{
    if obj.bbox_bottom > vy and obj.bbox_top < vy2
    {
        return true;
    }
}

return false;
