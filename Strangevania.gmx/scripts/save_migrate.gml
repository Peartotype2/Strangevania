///save_migrate(FILENAME)
//migrate old save format to new encoded format

var _file = argument[0];

if !file_exists(_file) then exit;

scr_loadgame_OLD(_file); //Load old format file
save_backup();
scr_savegame(); //Save in the new encoded .dat format

//file_delete(_file);
file_rename(_file, _file+".old");


