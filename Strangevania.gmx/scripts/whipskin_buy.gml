///whipskin_buy(id);

var _id = argument[0];
var _cost = director.whipskin_info[_id,style.cost]

if global.money < _cost then exit;

global.money -= _cost;
director.whipskin_info[_id,style.owned] = true;
event_fire("WhipskinPurchased", _id);
whipskin_equip(_id);

