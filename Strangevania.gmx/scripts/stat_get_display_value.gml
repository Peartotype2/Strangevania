///stat_get_display_value(stat)

var _stat = argument[0];
var _value = stat_get(_stat);

switch _stat
{
    case "SECONDS_PLAYED_TOTAL":
        return SecondsToTime(_value);
    break;
    
    case "SECONDS_PLAYED_SESSION":
        return SecondsToTime(_value);
    break;
    
    default:
        return num_separator(_value, ",", 3);
}

return _value;
