#define catch_error_prepare_buffer
/// (size:int)->buffer~
var _size = argument0;
gml_pragma("global", "global.__catch_error_buffer = undefined");
var _buf = global.__catch_error_buffer;
if (_buf == undefined) {
    _buf = buffer_create(_size, buffer_grow, 1);
    global.__catch_error_buffer = _buf;
} else if (buffer_get_size(_buf) < _size) {
    buffer_resize(_buf, _size);
}
buffer_seek(_buf, buffer_seek_start, 0);
return _buf;

#define catch_error_set_newer
/// (mode:catch_error_set_newer_*)
var l_val = argument0;
var l_result = catch_error_set_newer_raw(l_val);
if (l_result == -2) {
    var l_fatal = catch_error_get_fatal();
    catch_error_set_fatal(catch_error_fatal_ignore);
    catch_error_fatal_force_raw();
    show_error("[catch_error_set_newer] This is a dummy error to let us hook the handler", true);
    catch_error_set_fatal(l_fatal);
    l_result = catch_error_set_newer_raw(l_val);
}
return l_result;