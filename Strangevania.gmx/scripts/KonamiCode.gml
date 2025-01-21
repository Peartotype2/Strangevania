///KonamiCode()
// Ran when konami code sequence is entered correctly

if (room == intro) and (menumanager.menu_level == menulevel.statsmenu)
{
    event_fire("KonamiCode");
    audio_play_sound(snd_success, 0, 0);
    print("KONAMI CODE!!!!!");
    
    var _bool = stat_get("CHEATS_ENABLED");
    _bool = !_bool;
    
    director.showHiddenStats = _bool;
    stat_set("CHEATS_ENABLED", _bool);
}
