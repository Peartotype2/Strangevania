///string_from_file(filename,[removeBOM])
/*
Returns a string that represents all the text inside the file

Ported for GMS1.4
Original code by: jujuadams 2020-08-16
https://github.com/JujuAdams/SNAP/blob/master/scripts/string_from_file/string_from_file.gml
*/

// Arguments
var _filename   = argument[0]; // File to parse
var _remove_bom = true;        // Whether to look for the UTF8 byte order mark and remove it. Defaults to <true>

// If optional argument is provided
if (argument_count > 1 and argument[1] != undefined)
   {
   // Use it
   _remove_bom = argument[1];
   }
  
// Load the file
var _buffer = buffer_load(_filename);

// If we don't want to include the BOM and there is one present
if _remove_bom and (buffer_get_size(_buffer) >= 4) and (buffer_peek(_buffer, 0, buffer_u32) & $FFFFFF == $BFBBEF)
    {
    // Skip over it
    buffer_seek(_buffer, buffer_seek_start, 3);
    }
    
// Read the rest of the file into a string
var _string = buffer_read(_buffer, buffer_string);

// Clean up
buffer_delete(_buffer);

// Finish
return _string;
