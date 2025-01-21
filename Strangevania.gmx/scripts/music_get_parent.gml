///music_get_parent(song)

var _song = argument[0];
var _parent = false;

switch _song
{
    case song_doomsgate_short:  _parent = song_doomsgate; break;
    case song_victory_short:    _parent = song_victory; break;
}

return _parent;
