///cutscene_create(scene_info) returns cutscene object

var _info = argument[0];
var _cutsceneObject = instance_create(x, y, obj_cutscene);

with _cutsceneObject
{
    scene_info = _info;
}

return _cutsceneObject;
