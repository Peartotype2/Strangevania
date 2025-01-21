///game_add_hearts(amount);

var amount = argument[0];

var _oldvalue = gamemanager.hearts;
var _newvalue = (_oldvalue+amount);

game_set_hearts(_newvalue);
event_fire("HeartsAdded", amount, object_index);
