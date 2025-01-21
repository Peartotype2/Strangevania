///camblockCheckLeft()

with obj_camera_collider
{
    _blockLeft  = instance_place(x+min(-_margin, hsp), y, obj_camblock_left)

    var _leftAtEdge, _playerWithinBlock;
    if _blockLeft
    {
        _leftAtEdge = (bbox_left-_margin <= _blockLeft.bbox_right and _blockLeft.bbox_right < bbox_left+_border);
        _playerWithinBlock = (player.bbox_bottom > _blockLeft.bbox_top and player.bbox_top < _blockLeft.bbox_bottom
                                and player.bbox_left > _blockLeft.bbox_right); // <--IMPORTANT 
        
        if (_playerWithinBlock)
        {
            if (_leftAtEdge) {obj_camera.camblockLeft = _blockLeft.bbox_right;}
            else if (obj_camera.camblockEnabled)
            {
                x = obj_player.x-(vieww/2);
                var _steps = 0;
                while(!_leftAtEdge)
                {
                    x++;
                    _leftAtEdge = (bbox_left-_margin <= _blockLeft.bbox_right and _blockLeft.bbox_right < bbox_left+_border);
                    _steps++;
                    if (_steps > 1500) then break;
                }
                if _steps > 1500 {
                obj_camera.camblockEnabled = false;
                alarm[0] = 30;
                print("CAMBLOCK CHECK BROKE! ", _steps);
                //show_error("CAMBLOCK CHECK BROKE!#LEFT SIDE", false);
                } else {
                viewx = x;
                obj_camera.camblockLeft = _blockLeft.bbox_right;
                }
            }
        }
        else {obj_camera.camblockLeft = 0;}
    }
    else {obj_camera.camblockLeft = 0;}
}
