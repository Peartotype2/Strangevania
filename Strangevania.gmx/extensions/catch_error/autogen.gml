#define catch_error_set_normal
/// catch_error_set_normal(catch_error_normal_:int)->bool
var _buf = catch_error_prepare_buffer(4);
buffer_write(_buf, buffer_s32, argument0);
return catch_error_set_normal_raw(buffer_get_address(_buf), 4);

#define catch_error_get_normal
/// catch_error_get_normal()->int
var _buf = catch_error_prepare_buffer(1);
return catch_error_get_normal_raw(buffer_get_address(_buf), 1);

#define catch_error_set_fatal
/// catch_error_set_fatal(catch_error_fatal_:int)->bool
var _buf = catch_error_prepare_buffer(4);
buffer_write(_buf, buffer_s32, argument0);
return catch_error_set_fatal_raw(buffer_get_address(_buf), 4);

#define catch_error_get_fatal
/// catch_error_get_fatal()->int 
var _buf = catch_error_prepare_buffer(1);
return catch_error_get_fatal_raw(buffer_get_address(_buf), 1);

#define catch_error_set_prompt
/// catch_error_set_prompt(catch_error_prompt_:int, text:string = "", title:string = "", MSDN_MessageBox_type:int = -1)->bool
var _buf = catch_error_prepare_buffer(13);
buffer_write(_buf, buffer_s32, argument[0]);
if (argument_count >= 4) {
	buffer_write(_buf, buffer_bool, true);
	buffer_write(_buf, buffer_s32, argument[3]);
} else buffer_write(_buf, buffer_bool, false);
return catch_error_set_prompt_raw(buffer_get_address(_buf), 13, argument[1], argument[2]);

#define catch_error_set_dump_path
/// catch_error_set_dump_path(path:string = "")->bool
var _buf = catch_error_prepare_buffer(2);
return catch_error_set_dump_path_raw(buffer_get_address(_buf), 2, argument[0]);

#define catch_error_set_exec
/// catch_error_set_exec(path:string = "", args:string = "")->bool
var _buf = catch_error_prepare_buffer(4);
return catch_error_set_exec_raw(buffer_get_address(_buf), 4, argument[0], argument[1]);

