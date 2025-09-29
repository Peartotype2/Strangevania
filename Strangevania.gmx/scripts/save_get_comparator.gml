///save_get_comparator(FILENAME)

var _filename = argument[0];

if !file_exists(_filename) return false;

var _file = file_text_open_read(_filename);
var _str = file_text_read_string(_file);
file_text_close(_file);

return _str;
