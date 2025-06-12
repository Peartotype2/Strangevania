///CalculateHolidays()
with director
{
    date_set_timezone(timezone_local);
    switch (current_month)
    {
        //January
        case 1:
            if current_day == 5 {GAME_HOLIDAY = "gummybday";}
            if current_day == 9 {GAME_HOLIDAY = "austinbday";}
        break;
        
        //February
        case 2:  break;
        
        //March
        case 3:  break;
        
        //April
        case 4:
            if current_day == 7 {GAME_HOLIDAY = "elenabday";}
            if current_day == 15 {GAME_HOLIDAY = "keypilotbday";}
        break;
        
        //May
        case 5:
            if current_day == 24 {GAME_HOLIDAY = "davidbday";}
        break;
        
        //June
        case 6:
            if current_day == 24 {GAME_HOLIDAY = "pearbday";}
        break;
        
        //July
        case 7:
            if current_day == 5 {GAME_HOLIDAY = "cookiebday";}
        break;
        
        //August
        case 8:
            if current_day == 25 {GAME_HOLIDAY = "outlawday";}
        break;
        
        //September
        case 9:  break;
        
        //October
        case 10:  break;
        
        //November
        case 11:  break;
        
        //December
        case 12:
            if current_day == 7 {GAME_HOLIDAY = "charliebday";}
            if valWithin(current_day, 21, 27) {GAME_HOLIDAY = "christmas";}
            if current_day == 26 {GAME_HOLIDAY = "kylebday";}
        break;
        
        default: GAME_HOLIDAY = "NONE"; break;
    }
}
