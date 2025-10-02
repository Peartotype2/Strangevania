///save_check_mismatch()

var _prefix = director.saveBackupPrefix;
var _suffix = director.saveBackupSuffix;

if !file_exists(_prefix+"1"+_suffix)
{
    print("CAN'T CHECK FOR SAVE MISMATCH, NO BACKUPS FOUND!!");
    exit;
}

var _currentSave = save_get_comparator(SAVE_FILE_NAME);

var _backupName = save_get_last_backup();
var _backupSave = save_get_comparator(_backupName);

director.saveMismatch = (_currentSave != _backupSave);
if director.saveMismatch {print("SAVE FILE BACKUP MISMATCH DETECTED!!");}
