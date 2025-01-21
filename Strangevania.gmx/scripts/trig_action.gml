///trig_action(script, args..)

var _scr = argument[0];

var _args;
var len = argument_count-1;
var i = 0; repeat(len)
{
    _args[i] = argument[i+1];
    i++;
}

//event_unregister(trigID, id)
event_register_script(trigID, id, _scr, TRIGGER_ARGS, _args)
