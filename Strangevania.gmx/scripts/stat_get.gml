///stat_get(stat)
with stattracker
{
    var _stat = argument[0];
    var _value;
    
    with stattracker
    {
        _value = statMap[? _stat];
    }
    
    return _value;
}
