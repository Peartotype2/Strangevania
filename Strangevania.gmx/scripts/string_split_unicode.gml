///string_split_unicode(string)

var _str = argument[0];

var list = ds_list_create();
var current_line = "";
var len = string_length(_str);

for (var i = 1; i <= len; i++) {
    var c = string_char_at(_str, i);
    var c_code = ord(c);
    if (c_code == 8232 || c_code == 8233 || c_code == 10 || c_code == 13) {
        ds_list_add(list, current_line);
        current_line = "";
    } else {
        current_line += c;
    }
}
// Add last line
ds_list_add(list, current_line);

// Convert ds_list to array
var arr = 0;
var list_size = ds_list_size(list);
for (var j = 0; j < list_size; j++) {
    arr[j] = list[| j];
}

ds_list_destroy(list);

return arr;
