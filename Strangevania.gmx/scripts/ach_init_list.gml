///ach_init_list()

ach_register("firstkill", "First Blood", ach_icon_firstkill,
"Kill your first enemy.",
true, 1, "PLAYER_KILLS");

ach_register("warrior", "Warrior", ach_icon_firstkill,
"Kill 100 enemies.",
true, 100, "PLAYER_KILLS", a1(50, 75));

ach_register("hunter", "Monster Hunter", ach_icon_firstkill,
"Kill 500 enemies.",
true, 500, "PLAYER_KILLS", a1(200, 300, 400));

ach_register("champion", "Champion", ach_icon_firstkill,
"Kill 1000 enemies.",
true, 1000, "PLAYER_KILLS", a1(700, 900));

ach_register("warlord", "Warlord", ach_icon_firstkill,
"Kill 3000 enemies.",
true, 3000, "PLAYER_KILLS", a1(1500, 2000, 2500, 2900));

ach_register("holybbq", "Holy BBQ", ach_icon_holybbq,
"Cook up some BBQ with holy fire.");

ach_register("gameover", "Game Over Man", ach_icon_gameover,
"Lose all your lives and fail your quest...");

ach_register("stylish", "Stylish", ach_icon_stylish,
"Change up your style.",
false, 1, "PLAYER_STYLES_OWNED");

ach_register("fashion", "Fashion Guru", ach_icon_fashion,
"Purchase all available styles.",
false, director.skin_index_max, "PLAYER_STYLES_OWNED");

ach_register("exercise", "Good Exercise", ach_icon_exercise,
"Take 500 steps up or down stairs.",
true, 500, "PLAYER_STAIRS_CLIMBED", a1(100, 200, 300, 400));

ach_register("rocky", "Rocky", ach_icon_rocky,
"Take 1000 steps up or down stairs.",
true, 1000, "PLAYER_STAIRS_CLIMBED", a1(600, 700, 800, 900));

ach_register("casanova", "Casanova", ach_icon_fashion,
"Collect 1000 hearts.",
true, 1000, "PLAYER_HEARTS_COLLECTED", a1(100, 250, 500, 750, 900));

ach_register("burnout", "Burnout", ach_icon_hidden,
"Destroy 999 candles.",
true, 999, "PLAYER_CANDLES_BROKEN", a1(100, 250, 500, 750, 900));

ach_register("longname", "An achievement with longname", ach_icon_hidden,
"This is definitely an achievement that has a long name.");

ach_register("longname2", "The one billy bob guy thing yes", ach_icon_hidden,
"This is definitely an achievement that has a long name as well I hope I can make the code fit it all.");

var _count = 37;
for(i=0;i<_count;i++)
{
    ach_register("test" + string(achievement_count), "Test " + string(achievement_count), ach_icon_blank,
 "Testing achievements is fun.");
}

