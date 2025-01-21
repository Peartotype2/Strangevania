///cutscene_fade(in/out, increment, color, [waitUntilDone],[drawDepth])
var arg_c = argument_count;

var _fadein = argument[0];
if is_string(_fadein)
{
    if _fadein == "fadein" then _fadein = true;
    else if _fadein == "fadeout" then _fadein = false;
    else _fadein = 0;
}
var _inc = argument[1];
var _col = argument[2];

var _wait = true;
if arg_c > 3 then _wait = argument[3];

var _depth = -3;
if arg_c > 4 then _depth = argument[4];


if !instance_exists(obj_fade)
{
    instance_create(5, 5, obj_fade);
}

with obj_fade
{
    depth = _depth;
    fadein = _fadein;
    inc = _inc*iif(fadein, -1, 1);
    color = _col;
    if fadein and alpha
    {
        alpha += inc;
        done = false;
    }
}

if _wait
{
    if obj_fade.done
    {
        with obj_fade
        {
            if fadein then instance_destroy();
        }
        cutscene_end_action();
    }
}
else
{
    if obj_fade.done
    {
        with obj_fade
        {
            if fadein then instance_destroy();
        }
    }
    cutscene_end_action();
}
