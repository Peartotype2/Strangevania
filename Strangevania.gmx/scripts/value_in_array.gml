/// value_in_list(val, list)

var _val = argument[0];
var _arr = argument[1];

for (var i = 0; i < array_length_1d(_arr); i++) {
    if (_arr[i] == _val) return true;
}
return false;
