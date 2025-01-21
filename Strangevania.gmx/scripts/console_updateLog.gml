///console_updateLog()
with console
{
    file_text_open_write(debugLogFilename);
    
    var _len = ds_list_size(debugLog);
    for(var i=0;i < _len;i++)
    {
        var _str = debugLog[| i];
        file_text_write_string(debugLogFile, _str);
        file_text_writeln(debugLogFile);
    }
    
    file_text_close(debugLogFile);
}
