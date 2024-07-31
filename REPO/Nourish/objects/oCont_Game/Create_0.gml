player_create();
actor_step_queue   = ds_queue_create();
actor_render_queue = ds_queue_create();

wall_grid = ds_grid_create(WORLDSIZE_W, WORLDSIZE_H);
light_grid = ds_grid_create(WORLDSIZE_W, WORLDSIZE_H);
ds_grid_clear(wall_grid, -1);
ds_grid_clear(light_grid, 0);
light_arr = [];

for (var _i = 0; _i < WORLDSIZE_W; _i++){
	wall_add(_i, 0);
	wall_add(_i, WORLDSIZE_H - 1);
	wall_add(0, _i);
	wall_add(WORLDSIZE_W - 1, _i);
}
repeat(12){
	wall_add(irandom(WORLDSIZE_W - 1), irandom(WORLDSIZE_H - 1));
}

light_add(3, 3, __LIGHT_LEVEL.BRIGHT);
light_add(4, 3, __LIGHT_LEVEL.BRIGHT);
light_add(5, 3, __LIGHT_LEVEL.BRIGHT);
light_add(6, 3, __LIGHT_LEVEL.BRIGHT);
light_add(7, 3, __LIGHT_LEVEL.BRIGHT);
light_add(8, 4, __LIGHT_LEVEL.BRIGHT);
light_add(17, 17, __LIGHT_LEVEL.BRIGHT);

//wall_remove_circle(11, 11, 2);
//wall_remove_circle(6, 6,   2);
//wall_add_circle(6, 6, 2);

//wall_add_circle(12, 12, 4);
//wall_remove_circle(12, 12, 1);

world_sprite = undefined;

game_declare_methods();

floor_surf  = undefined;
wall_surf   = undefined;
actor_surf  = undefined;
light_surf_0  = undefined;
light_surf_1  = undefined;
light_surf_2  = undefined;
light_surf_3  = undefined;
light_surf_4  = undefined;
shadow_surf_0 = undefined;
shadow_surf_1 = undefined;
shadow_surf_2 = undefined;
shadow_surf_3 = undefined;
if (DEV_MODE){
	debug_surf = undefined;
}

shadow_frame = 0;
shadow_counter = 0;
shadow_counter_max = 36;
shadow_flip = 1;
shadow_arr = [];

cam_x = 0;
cam_y = 0;

show_debug_overlay(true);

refresh_actor_surf = false;
refresh_wall_surf  = false;
refresh_light_surf = false;

window_set_cursor(cr_none);
cursor_spr = sGUI_Cursor_Default;
hotbar = new __hotbar_class();