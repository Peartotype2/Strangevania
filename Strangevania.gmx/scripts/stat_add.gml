///stat_add(stat, amount);
with stattracker
{
    var stat = argument[0];
    var amount = 0;
    if argument_count > 1 {amount = argument[1]}
    else {amount = _EVENTDATA[0]}
    
    //show_debug_message("STAT: " + string(amount) + " added to " + stat);
    
    var _oldvalue = statMap[? stat];
    var _newvalue = _oldvalue + amount;
    stat_set(stat, _newvalue);
    
    return _newvalue;
}
