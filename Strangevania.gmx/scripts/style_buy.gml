///style_buy(id);

var _id = argument[0];
var _cost = director.styleinfo[_id,style.cost]

if global.money < _cost then exit;

global.money -= _cost;
director.styleinfo[_id,style.owned] = true;
event_fire("StylePurchased", _id);
style_equip(_id);

