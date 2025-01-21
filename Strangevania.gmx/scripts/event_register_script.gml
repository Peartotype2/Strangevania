///event_register_script(event, id, script, args)

with eventhandler
{
    var ev = argument[0];
    var objID = argument[1];
    
    if !ds_map_exists(eventMap, ev)
    {
        var listenerList = ds_list_create();
        
        ds_map_add_list(eventMap, ev, listenerList);
    } else {
        var listenerList = eventMap[? ev];
    }
    
    var listenerInfo;
    
    listenerInfo[0] = objID;
    listenerInfo[1] = argument[2]; //script
    
    if room_is_level() and is_real(objID)
    {
        if object_get_parent(objID.object_index) != manager_parent
        {
            var tempInfo;
            tempInfo[0] = ev;
            tempInfo[1] = objID;
            tempInfo[2] = objID.object_index;
            ds_list_add(roomEvents, tempInfo);
        }
    }
    
    var _args;
    var len = argument_count-3;
    var i = 0; repeat(len)
    {
        _args[i] = argument[i+3];
        //listenerInfo[i+2] = argument[i+3];
        i++;
    }
    
    if argument[3] == TRIGGER_ARGS
    {
        _args = argument[4];
        //show_debug_message(_args);
    }
    
    listenerInfo[2] = _args;
    
    ds_list_add(listenerList, listenerInfo);
}
