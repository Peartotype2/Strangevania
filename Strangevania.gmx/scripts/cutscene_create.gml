///cutscene_create(scene_info)

var _info = argument[0];

with instance_create(x, y, obj_cutscene)
{
    scene_info = _info;
}
