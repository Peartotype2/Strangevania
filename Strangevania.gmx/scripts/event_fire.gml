///event_fire(event, data)

with eventhandler
{
    var ev = argument[0];
    var data = 0;
    if argument_count > 1
    {
        var len = argument_count-1;
        var i = 0; repeat(len)
        {
            data[i] = argument[i+1];
            i++;
        }
    }
    
    if ds_map_exists(eventMap, ev)
    {
        var listenerList = eventMap[? ev];
        
        var len = ds_list_size(listenerList);
        
        var listenerInfo, listener, script, args;
        var i = (len-1); repeat(len)
        {
            listenerInfo = listenerList[| i];
            listener = listenerInfo[0];
            script = listenerInfo[1];
            args = listenerInfo[2];
            
            if instance_exists(listener) and !is_string(listener)
            {
                with listener
                {
                    _EVENTDATA = data;
                    script_execute_alt(script, args);
                    _EVENTDATA = 0;
                    _EVENTDATA[0] = 0;
                }
            }
            else
            {
                eventhandler._EVENTDATA = data;
                script_execute_alt(script, args);
                eventhandler._EVENTDATA = 0;
                eventhandler._EVENTDATA[0] = 0;
            }
            
            i--;
        }
        print("EVENT: (" + string(ev) + ") FIRED");
    }
    else
    {
        var _list = eventhandler.noListenerBlacklist;
        var _len = ds_list_size(_list);
        var _blacklisted = false;
        for(e = 0; e < _len; e++)
        {
            if ev == _list[| e]
            {
                _blacklisted = true;
                break;
            }
        }
        if !_blacklisted {print("EVENT: (" + string(ev) + ") FIRED WITH NO LISTENERS!");}
    }
}
