///save_open(FILENAME)

var _file = argument[0];

if !is_undefined(director.savemap)
{
    if ds_exists(director.savemap, ds_type_map)
    {ds_map_destroy(director.savemap);}
    director.savemap = undefined;
}

director.savemap = ds_map_secure_load(_file);
director.savemap_filename = _file;
