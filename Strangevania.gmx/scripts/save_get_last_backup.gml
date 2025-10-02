///save_get_last_backup()

var _prefix = director.saveBackupPrefix;
var _suffix = director.saveBackupSuffix;
var _max    = director.saveBackupMax;

if !file_exists(_prefix+"1"+_suffix)
{
    print("CANT GET LAST BACKUP, NO SAVE BACKUPS FOUND!");
    return false;
}

var _backupNum = 1;

for(var i=_max; i>=0; i--)
{
    if file_exists(_prefix+string(i)+_suffix)
    {
        _backupNum = i;
        break;
    }
}

var _backupName = (_prefix+string(_backupNum)+_suffix)

return _backupName;
