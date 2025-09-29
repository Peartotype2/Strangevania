///save_backup()
var _prefix = director.saveBackupPrefix;
var _suffix = director.saveBackupSuffix;
var _num    = 1;
var _max    = director.saveBackupMax;

while (file_exists(_prefix+string(_num)+_suffix) and _num <= _max)
{
    _num++
}

//If max backup files are saved
if _num > _max
{
    var _deleteFile = (_prefix+"1"+_suffix)
    file_delete(_deleteFile); //Delete oldest backup
    while file_exists(_deleteFile) {}
    var i = 2;
    repeat(_max-1)
    {
        //Rename each backup to its previous number (BACKUP2 -> BACKUP1)
        var _rename = file_rename(_prefix+string(i)+_suffix, _prefix+string(i-1)+_suffix);
        while file_exists(_prefix+string(i)+_suffix) {}
        i++;
    }
    _num = _max;
}
print("BACKUP SAVED: ", _num);
scr_savegame(_prefix+string(_num)+_suffix);
