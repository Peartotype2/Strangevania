///InsideRoom(x, y, margin)

var inputx = argument[0];
var inputy = argument[1];
var margin = 0;
if argument_count > 2 then margin = argument[2];

var vx = 0 - margin;
var vy = 0 - margin;
var vx2 = vx + room_width + (margin*2); // Margin doubled to account for margin..
var vy2 = vy + room_height + (margin*2); //..taken away from vx and vy initially

if inputx > vx and inputx < vx2
{
    if inputy > vy and inputy < vy2
    {
        return true;
    }
}

return false;
