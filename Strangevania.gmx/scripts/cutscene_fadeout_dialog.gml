///cutscene_fadeout_dialog([fadeSpeed])
var arg_c = argument_count;

var _speed = 0.066;

if arg_c > 0 then _speed = argument[0];

if _speed > 0 then _speed *= -1; //If speed is a positive value make it negative
with obj_dialog
{
    fade_speed = _speed;
}

if obj_dialog.fade_alpha <= 0
{
    instance_destroy(obj_dialog);
    cutscene_end_action();
}
