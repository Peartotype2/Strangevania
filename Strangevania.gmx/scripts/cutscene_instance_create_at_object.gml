///cutscene_instance_create_at_object(targetObj, obj, [name], [sprite], [toFloor?])

var _target = argument[0];
var _x = _target.x;
var _y = _target.y;
var _obj = instance_create(_x, _y, argument[1]);

var _instID = array_length_1d(instanceList);
var _name = string(_instID)
if argument_count > 2 {_name = string(argument[2]);}
var _customSpr = -1;
if argument_count > 3 {_customSpr = argument[3];}
var _toFloor = false;
if argument_count > 4 {_toFloor = argument[4];}

if _customSpr != -1 then _obj.sprite_index = _customSpr;
if _toFloor then object_to_floor(_obj);

lastInstanceCreated = _obj;

instanceList[_instID] = _obj
variable_instance_set(id, "inst_"+_name, _obj);

cutscene_end_action();
