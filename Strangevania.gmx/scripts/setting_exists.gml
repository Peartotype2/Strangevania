///setting_exists(name)

var _name = argument[0];

for(i=0;i<settings.count;i++)
{
    var _set = settings.list[| i];
    if _name == _set[? "name"]
    {
        return true;
    }
}

return false;
