///DoorCutsceneInfo()

var __info; 
__info = cutscene_info_init();
__info = scene_add_action(__info, cutscene_disable_player_input, true);
__info = scene_add_action(__info, cutscene_wait_player_is_still, true);
__info = scene_add_action(__info, cutscene_player_look, player_face_direction);
__info = scene_add_action(__info, cutscene_pause, true);

if camera_movement_enabled
{
    __info = scene_add_action(__info, cutscene_cam_lerp, true, 0.15);
    __info = scene_add_action(__info, cutscene_instance_create_at_object, obj_camera, actor_puppet, "camtarget");
    __info = scene_add_action(__info, cutscene_cam_target, "camtarget");
    __info = scene_add_action(__info, cutscene_change_var, obj_camera, "camblockEnabled", false);
    __info = scene_add_action(__info, cutscene_move_actor, "camtarget", x, y, false, 999);
    __info = scene_add_action(__info, cutscene_wait_cam_on_target, true);
    __info = scene_add_action(__info, cutscene_wait, 0.5);
}

__info = scene_add_action(__info, cutscene_door_open, true);
__info = scene_add_action(__info, cutscene_wait, 0.5);

//player walks through
__info = scene_add_action(__info, cutscene_change_var, player, "sprite_index", spr_player_run);
__info = scene_add_action(__info, cutscene_change_var, player, "image_speed", 1);
__info = scene_add_action(__info, cutscene_move_actor, player, player_end_x, y+33, false, player.walksp);
__info = scene_add_action(__info, cutscene_change_var, player, "sprite_index", spr_player_idle);

if camera_movement_enabled
{
    __info = scene_add_action(__info, cutscene_wait, 0.5);
    __info = scene_add_action(__info, cutscene_move_actor, "camtarget", camera_end_x, y, false, 999);
    __info = scene_add_action(__info, cutscene_wait_cam_on_target, true);
    __info = scene_add_action(__info, cutscene_wait, 0.5);
}

if camera_movement_enabled
{
__info = scene_add_action(__info, cutscene_change_var, obj_camera, "camblockEnabled", true);
__info = scene_add_action(__info, cutscene_cam_lerp, false);
//__info = scene_add_action(__info, cutscene_move_actor, "camtarget", player_end_x, y, false, player.walksp);
__info = scene_add_action(__info, cutscene_cam_target, player);
}

__info = scene_add_action(__info, cutscene_door_open, false);
__info = scene_add_action(__info, cutscene_wait, 0.5);

__info = scene_add_action(__info, cutscene_disable_player_input, false);
__info = scene_add_action(__info, cutscene_pause, false);

return __info;
