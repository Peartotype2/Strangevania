///ObjectDestroy(objID, [destroyEvent])

var _obj = argument[0];

if !instance_exists(_obj) then exit;

var _execute = true;
if (argument_count > 1) {_execute = argument[1];}

instance_destroy(_obj, _execute);
