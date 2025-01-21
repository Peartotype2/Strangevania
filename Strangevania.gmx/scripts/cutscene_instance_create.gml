///cutscene_instance_create(x, y, obj, [name], [sprite], [toFloor?])

var _obj = instance_create(argument[0], argument[1], argument[2]);

var _instID = array_length_1d(instanceList);
var _name = string(_instID)
if argument_count > 3 {_name = string(argument[3]);}
var _customSpr = -1;
if argument_count > 4 {_customSpr = argument[4];}
var _toFloor = false;
if argument_count > 5 {_toFloor = argument[5];}

if _customSpr != -1 then _obj.sprite_index = _customSpr;
if _toFloor then object_to_floor(_obj);

lastInstanceCreated = _obj;

instanceList[_instID] = _obj
variable_instance_set(id, "inst_"+_name, _obj);

cutscene_end_action();
