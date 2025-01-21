///save_close()

if is_undefined(director.savemap_filename) then exit;
if director.savemap_filename == -1 then exit;

ds_map_secure_save(director.savemap, director.savemap_filename);

if ds_exists(director.savemap, ds_type_map)
{ds_map_destroy(director.savemap);}
director.savemap = undefined;
director.savemap_filename = undefined;
