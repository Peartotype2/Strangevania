///camblockCheckRight()


with obj_camera_collider
{
    _blockRight = instance_place(x+max(_margin, hsp), y, obj_camblock_right)

    var _rightAtEdge, _playerWithinBlock;
    if _blockRight
    {
        _rightAtEdge = (bbox_right+_margin >= _blockRight.bbox_left and _blockRight.bbox_left > bbox_right-_border);
        _playerWithinBlock = (player.bbox_bottom > _blockRight.bbox_top and player.bbox_top < _blockRight.bbox_bottom
                                and player.bbox_right < _blockRight.bbox_left); // <--IMPORTANT 
        
        if (_playerWithinBlock)
        {
            if (_rightAtEdge) {obj_camera.camblockRight = _blockRight.bbox_left;}
            else if (obj_camera.camblockEnabled)
            {
                x = obj_player.x-(vieww/2);
                var _steps = 0;
                while(!_rightAtEdge)
                {
                    x--;
                    _rightAtEdge = (bbox_right+_margin >= _blockRight.bbox_left and _blockRight.bbox_left > bbox_right-_border);
                    _steps++;
                    if (_steps > 1500) then break;
                }
                if _steps > 1500 {
                obj_camera.camblockEnabled = false;
                alarm[0] = 30;
                print("CAMBLOCK CHECK BROKE! ", _steps);
                //show_error("CAMBLOCK CHECK BROKE!#RIGHT SIDE", false);
                } else {
                viewx = x;
                obj_camera.camblockRight = _blockRight.bbox_left;
                }
            }
        }
        else {obj_camera.camblockRight = 0;}
    }
    else {obj_camera.camblockRight = 0;}
}
