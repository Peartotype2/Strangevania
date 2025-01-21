///ChangeResolution(w, h)

var w = argument[0];
var h = argument[1];

window_set_size(w, h);
surface_resize(application_surface, w, h);
director.alarm[0] = 15;
