///cutscene_show_dialog(canSkip, textString, [portraitSprite], [writeSpeed], [soundRate], [soundFile], [pitchMin], [pitchMax], [textScale], [drawDepth], [fadeSpeed])
var arg_c   = argument_count;

var _skip   = argument[0];
var _text   = argument[1];

var _spr        = spr_nothing;
var _speed      = 1;
var _rate       = 2;
var _sound      = snd_voice1;
var _pitchMin   = 0.95;
var _pitchMax   = 1.05;
var _scale      = 1;
var _depth      = -2;
var _fadeSpeed  = 0.066;

if arg_c > 2 then _spr   = argument[2];
if arg_c > 3 then _speed = argument[3];
if arg_c > 4 then _rate  = argument[4];
if arg_c > 5 then _sound = argument[5];
if arg_c > 6 then _pitchMin = argument[6];
if arg_c > 7 then _pitchMax = argument[7];
if arg_c > 8 then _scale = argument[8];
if arg_c > 9 then _depth = argument[9];
if arg_c > 10 then _fadeSpeed = argument[10];

var _create = true;
if instance_exists(obj_dialog)
{
    _create = false;
    var _dialog = instance_nearest(x, y, obj_dialog);
    if _dialog.scene_id == obj_cutscene.scene
    {
        if _dialog.finished
        {
            cutscene_end_action();
        }
    }
    else
    {
        instance_destroy(_dialog);
        _create = true;
    }
}

if _create
{
    var _dialog = instance_create(x, y, obj_dialog)
    
    with _dialog
    {
        scene_id = obj_cutscene.scene;
        
        canSkip = _skip;
        text = _text;
        writeSpeed = _speed;
        portrait = _spr;
        _soundFile = _sound;
        _soundRate = _rate;
        pitchMin = _pitchMin;
        pitchMax = _pitchMax;
        
        _textscale *= _scale;
        fade_speed = _fadeSpeed;
        
        //line_sep = _sep;
        depth = _depth
        
    }
}
