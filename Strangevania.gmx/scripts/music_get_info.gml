///music_get_info(song)

var _song = argument[0];

var _parent = music_get_parent(_song);
if _parent != false {_song = _parent;}

var artist = 1;
var title = 0;
var _sinfo = array_create(2);
_sinfo[title] = sound_get_name(_song);
_sinfo[artist] = "??????";

switch _song
{
    case song_entersandman:
        _sinfo[title] = "Enter Sandman"
        _sinfo[artist] = "Metallica";
    break;
    
    case song_doomsgate:
        _sinfo[title] = "At Doom's Gate"
        _sinfo[artist] = "Mick Gordon";
    break;

    case song_intheway:
        _sinfo[title] = "Something In The Way"
        _sinfo[artist] = "Nirvana";
    break;
    
    case song_thisfire:
        _sinfo[title] = "This Fire"
        _sinfo[artist] = "Franz Ferdinand";
    break;
    
    case song_songofhealing:
        _sinfo[title] = "Song of Healing"
        _sinfo[artist] = "Majora's Mask";
    break;
    
    case song_hyruleking:
        _sinfo[title] = "Farewell Hyrule King"
        _sinfo[artist] = "Wind Waker";
    break;
    
    case song_namelesssong:
        _sinfo[title] = "Nameless Song"
        _sinfo[artist] = "Dark Souls";
    break;
    
    case song_victory:
        _sinfo[title] = "Sweet Victory"
        _sinfo[artist] = "Bob Kulick & David Glen Eisley";
    break;
    
    case song_finale:
        _sinfo[title] = "The Final Battle"
        _sinfo[artist] = "RedStone128";
    break;
}

return _sinfo;
