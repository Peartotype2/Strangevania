///ach_init_list()

ach_register("firstkill", "First Blood", ach_icon_firstkill,
"Kill your first enemy.",
true, 1, "PLAYER_KILLS");

ach_register("warrior", "Warrior", ach_icon_warrior,
"Kill 100 enemies.",
true, 100, "PLAYER_KILLS", a1(50, 75));

ach_register("hunter", "Monster Hunter", ach_icon_hunter,
"Kill 500 enemies.",
true, 500, "PLAYER_KILLS", milestoneList(500, 100, 100));//a1(200, 300, 400));

ach_register("vanquisher", "Vanquisher", ach_icon_vanquisher,
"Kill 1000 enemies.",
true, 1000, "PLAYER_KILLS", a1(769));

ach_register("warlord", "Warlord", ach_icon_warlord,
"Kill 5000 enemies.",
true, 5000, "PLAYER_KILLS", milestoneList(5000, 500, 1000));

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
true, 500, "PLAYER_STAIRS_CLIMBED", milestoneList(500, 100));

ach_register("rocky", "Rocky", ach_icon_rocky,
"Take 1000 steps up or down stairs.",
true, 1000, "PLAYER_STAIRS_CLIMBED", milestoneList(1000, 100, 500));

ach_register("casanova", "Casanova", ach_icon_fashion,
"Collect 1000 hearts.",
true, 1000, "PLAYER_HEARTS_COLLECTED", milestoneList(1000, 250));

ach_register("burnout", "Burnout", ach_icon_hidden,
"Destroy 999 candles.",
true, 999, "PLAYER_CANDLES_BROKEN", milestoneList(1000, 250));

ach_register("longname", "An achievement with longname", ach_icon_hidden,
"This is definitely an achievement that has a long name. Haha I LOVE long names and descriptions for my achievements!");

ach_register("achwhore", "Achievement Whore", ach_icon_hidden,
"Unlock every achievement. You whore.",
true, achievement_count, "NONE", milestoneList(achievement_count, 10));

/*var _count = 37;
for(i=0;i<_count;i++)
{
    ach_register("test" + string(achievement_count), "Test " + string(achievement_count), ach_icon_blank,
 "Testing achievements is fun.");
}*/

