///game_calculate_subversion([buildDay] <- just for debug )
//Adds the extra unique version text depending on the build
with director
{
    var _alphabet = "A|B|C|D|E|F|G|H|I|J|K|L|M|N|O|P|Q|R|S|T|U|V|W|X|Y|Z|AA|AB|AC|AD|AE|ERROR";
    var _alphabetArray = string_split(_alphabet, "|");
    var _alphabetLen = array_length_1d(_alphabetArray);
    
    date_set_timezone(timezone_utc);
    ver_date = date_date_string(GM_build_date);
    ver_day = date_get_day(GM_build_date);
    ver_hour = string(date_get_hour(GM_build_date));
    ver_min = string(date_get_minute(GM_build_date));
    
    //Just used for debug testing, normally never used
    if argument_count != 0 then ver_day = argument[0];
    ver_day = clamp(ver_day, 1, _alphabetLen);
    
    var _letter = _alphabetArray[real(ver_day)-1];
    
    game_subversion = _letter+ver_hour+ver_min;
}
