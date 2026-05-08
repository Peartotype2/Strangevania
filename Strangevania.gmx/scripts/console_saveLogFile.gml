///console_saveLogFile()

var time = date_get_string();

file_copy(debugLogFilename, working_directory + "logs/GAMELOG-"+time+".txt");
