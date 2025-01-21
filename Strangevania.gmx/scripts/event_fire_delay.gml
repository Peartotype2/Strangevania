///event_fire_delay(event, delay, [data])

var _ev = argument[0];
var _delay = argument[1];
var _data = NO_EVENT_DATA;
if argument_count > 2
{
    var len = argument_count-2;
    var i = 0; repeat(len)
    {
        _data[i] = argument[i+2];
        i++;
    }
}

with instance_create(0, 0, obj_delay)
{
    event       = _ev;
    delay       = _delay;
    eventData   = _data;
    
    activate    = true;
    destroySelf = true;
    fromScript  = true;
}
    

    
