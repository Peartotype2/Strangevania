///CalculateHolidays()
with director
{
    date_set_timezone(timezone_local);
    switch (current_month)
    {
        //January
        case 1:  break;
        
        //February
        case 2:  break;
        
        //March
        case 3:  break;
        
        //April
        case 4:  break;
        
        //May
        case 5:  break;
        
        //June
        case 6:  break;
        
        //July
        case 7:  break;
        
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
        break;
        
        default: GAME_HOLIDAY = "NONE"; break;
    }
}
