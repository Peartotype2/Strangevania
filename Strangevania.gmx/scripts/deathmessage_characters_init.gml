///deathmessage_characters_init()

deathmessage_manager.characterList = ds_list_create();

var _char = object_get_name(0);
var n = 0;

//Find first char object in asset list
while !string_contains("char_", _char)
{
    _char = object_get_name(n);
    if !string_contains("char_", _char) {n++;}
}

//Collect all char object names
while string_contains("char_", _char)
{
    if _char == "char_parent" {n++;}
    _char = object_get_name(n);
    
    if string_contains("char_", _char)
    {
        var _name = string_replace(_char, "char_", "");
        ds_list_add(deathmessage_manager.characterList, _name);
        var _size = ds_list_size(deathmessage_manager.characterList);
        print("CHARACTER INIT:", string(_size) + " " + _name + " ["+string(n)+"]");
        instance_create(0, 0, n);
    }
    n++;
}
