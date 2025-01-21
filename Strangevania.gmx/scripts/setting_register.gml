///setting_register(name, displayname, default, choices[], [visibleStat, category, var])
var arg_c = argument_count;

var _id, _name, _displayname, _var, _default, _choices;
with settings
{
    _id             =   settings.count;
    _name           =   argument[0];
    _displayname    =   argument[1];
    _default        =   argument[2];
    _value          =   _default;
    _choices        =   argument[3];
    _visible        =   "NONE";
    _category       =   -1;
    _var            =   -1;
    
    if arg_c > 4 then _visible  = argument[4];
    if arg_c > 5 then _category = argument[5];
    if arg_c > 6 then _var      = argument[6];
    
    var setting_info = ds_map_create();
    ds_map_add(setting_info, "id", _id);
    ds_map_add(setting_info, "name", _name);
    ds_map_add(setting_info, "displayname", _displayname);
    ds_map_add(setting_info, "var", _var);
    ds_map_add(setting_info, "default", _default);
    ds_map_add(setting_info, "value", _value);
    ds_map_add(setting_info, "choices", _choices);
    ds_map_add(setting_info, "visible", _visible);
    ds_map_add(setting_info, "category", _category);
    ds_list_add(settings.list, setting_info);
    settings.count++;
}
