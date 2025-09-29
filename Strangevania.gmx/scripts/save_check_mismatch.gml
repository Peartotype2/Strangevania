///save_check_mismatch()

var _prefix = director.saveBackupPrefix;
var _suffix = director.saveBackupSuffix;
var _max    = director.saveBackupMax;

if !file_exists(_prefix+"1"+_suffix)
{
    print("CAN'T CHECK FOR SAVE MISMATCH, NO BACKUPS FOUND!!");
    exit;
}

var _currentSave = save_get_comparator(SAVE_FILE_NAME);
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
var _backupSave = save_get_comparator(_backupName);

if _currentSave != _backupSave
{
    show_message("WARNING!#Your current save file does not match your last backup#
                                Loading backup file.#The mismatched file will be renamed to MISMATCH_");
                                
    file_rename(SAVE_FILE_NAME,"MISMATCH_"+SAVE_FILE_NAME);
    file_copy(_backupName, SAVE_FILE_NAME);
}

