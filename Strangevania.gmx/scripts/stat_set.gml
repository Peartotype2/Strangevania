///stat_set(stat, amount);
with stattracker
{
    var stat = argument[0];
    var amount = 0;
    if argument_count > 1 {amount = argument[1]}
    else {amount = _EVENTDATA[0]}
    
    var _oldvalue = stat_get(stat);
    
    if stat != "SECONDS_PLAYED_TOTAL" and stat != "SECONDS_PLAYED_SESSION"
    {print("STAT: " + stat + " ["+string(_oldvalue)+"] -> [" + string(amount) + "]");}
    
    ds_map_replace(statMap, stat, amount);
    event_fire(stat + "_updated", amount, _oldvalue)
    
    return amount;
}
