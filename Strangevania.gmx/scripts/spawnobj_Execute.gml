///spawnobj_Execute(args)

if console.helpMessage
{
    console.commandString = "/spawnobj {x} {y} {objectName}";
    return "Spawns given object at cords.";
    exit;
}

var args = argument[0];
if (array_length_1d(args) == 3)
{
  var xx = args[0];
  if xx == "mousex" then xx = mouse_x;
  else xx = real(xx);
  
  var yy = args[1];
  if yy == "mousey" then yy = mouse_y;
  else yy = real(yy);
  
  var _obj = asset_get_index(args[2]);
  if _obj == -1 {return "Invalid Object!";}
  spawn_obj(xx, yy, _obj);
  return "Object Spawned!";
}
else if (array_length_1d(args) == 1)
{
  var _obj = asset_get_index(args[0]);
  if _obj == -1 {return "Invalid Object!";}
  spawn_obj(mouse_x, mouse_y, _obj);
  return "Object Spawned!";
}
return "Invalid argument count.";
