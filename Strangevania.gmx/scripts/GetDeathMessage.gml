///GetDeathMessage(type OR id)
var _type = argument[0];
if is_real(_type)
{
    if _type == -1
    {
        var _rand = irandom(director.DeathMessage_Count-1)
        return director.DeathMessage_List[| _rand];
    }
    
    return director.DeathMessage_List[| _type];
}

var _rand = irandom(director.DeathMessage_Count-1)
var _msg = director.DeathMessage_List[| _rand];

if _msg[? "type"] != _type
{
    return GetDeathMessage(_type);
}
print("DEATH REPEAT");

return _msg;
