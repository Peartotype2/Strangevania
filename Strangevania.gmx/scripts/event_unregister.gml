///event_unregister(event, id, [printToConsole])

with eventhandler
{
    var ev = argument[0];
    var objID = argument[1];
    var printToConsole = true; if argument_count > 2 {printToConsole = argument[2];}
    var objName = "?"
    if instance_exists(objID) {objName = object_get_name(objID.object_index);}
    else if is_string(objID) 
    {
        var _tempach = ach_get_info(objID);
        if _tempach != undefined
        {
            objName = _tempach[? "displayname"];
        }
    }
    
    if ds_map_exists(eventMap, ev)
    {
        var listenerList = eventMap[? ev];
        var len = ds_list_size(listenerList);
        
        var _foundRegistry = false;
        var i = 0; repeat(len)
        {
            var listenerInfo = listenerList[| i];
            
            if listenerInfo[0] == objID
            {
                _foundRegistry = true;
                
                if printToConsole {print(objName, "("+string(objID)+")", " unregistered from ", string(ev));}
                
                if(len == 1)
                {
                    ds_list_destroy(listenerList);
                    ds_map_delete(eventMap, ev);
                }
                else
                {
                    ds_list_delete(listenerList, i);
                }
                break;
            }
            
            i++;
        }
        
        if _foundRegistry == false 
        {
            print(objName, "("+string(objID)+")", " NO REGISTRY FOUND TO ", string(ev));
        }
    }
    else {print(objName, "("+string(objID)+")", " EVENT STRING DOESNT EXIST: ", string(ev));}
}

