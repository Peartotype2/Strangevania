///console_saveLogFile()

date_set_timezone(timezone_local);
var date = date_current_datetime()
var time = date_datetime_string(date);

time = string_replace_all(time, "/", "_");
time = string_replace_all(time, ":", ".");
time = string_replace_all(time, " ", "_");

file_copy(debugLogFilename, working_directory + "logs/GAME-LOG-"+time+".txt");
