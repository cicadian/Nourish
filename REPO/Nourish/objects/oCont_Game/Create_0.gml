// Methods
game_declare_methods();
#region List of Methods
/*
dev_draw_collision
dev_draw_grid_coordinates
dev_draw_grid_value
*/
#endregion

// World Geometry
wall_grid = ds_grid_create(WORLDSIZE_W, WORLDSIZE_H);
ds_grid_clear(wall_grid, -1);

for (var _i = 0; _i < WORLDSIZE_W; _i++){
	wall_add(_i, 0);
	wall_add(_i, WORLDSIZE_H - 1);
	wall_add(0, _i);
	wall_add(WORLDSIZE_W - 1, _i);
}
wall_add(4, 1);
wall_add(4, 2);
wall_add(4, 3);
wall_add(4, 4);
wall_add(4, 5);
wall_add(4, 6);

// Lighting
light_grid = ds_grid_create(WORLDSIZE_W, WORLDSIZE_H);
ds_grid_clear(light_grid, 0);
light_arr = [];
//light_add(3, 3, 15, 2);
light_add(3, 3, __LIGHT_LEVEL.BRIGHT, LIGHT_MAX_VALUE);
light_add(3, 4, __LIGHT_LEVEL.MOODY, LIGHT_MAX_VALUE);
light_add(3, 5, __LIGHT_LEVEL.MOODY, LIGHT_MAX_VALUE);
light_add(3, 6, __LIGHT_LEVEL.MOODY, LIGHT_MAX_VALUE);
light_add(4, 7, __LIGHT_LEVEL.MOODY, LIGHT_MAX_VALUE);
light_add(5, 8, __LIGHT_LEVEL.MOODY, LIGHT_MAX_VALUE);
light_add(6, 8, __LIGHT_LEVEL.MOODY, LIGHT_MAX_VALUE);
light_add(7, 8, __LIGHT_LEVEL.MOODY, LIGHT_MAX_VALUE);
light_add(8, 8, __LIGHT_LEVEL.MOODY, LIGHT_MAX_VALUE);
light_add(9, 7, __LIGHT_LEVEL.MOODY, LIGHT_MAX_VALUE);
light_add(10, 6, __LIGHT_LEVEL.MOODY, LIGHT_MAX_VALUE);
light_add(11, 5, __LIGHT_LEVEL.MOODY, LIGHT_MAX_VALUE);
light_add(17, 3, __LIGHT_LEVEL.BRIGHT + 3, LIGHT_MAX_VALUE);
light_add(12, 5, __LIGHT_LEVEL.BRIGHT, LIGHT_MAX_VALUE);

// Collision
world_sprite = undefined;

// Rendering
floor_surf  = undefined;    // Render background geometry here
wall_surf   = undefined;    // Render world geometry here
actor_surf  = undefined;    // Render actors here
light_surf_0  = undefined;  // Used to subtract all DARK light values
light_surf_1  = undefined;  // ... DIM
light_surf_2  = undefined;  // ... MOODY
light_surf_3  = undefined;  // ... LIT
light_surf_4  = undefined;  // ... BRIGHT
shadow_surf = undefined;    // Actual shadow/lighting overlay
if (DEV_MODE){			    
	debug_surf = undefined; // Used for debug values and other text overlays
}
refresh_actor_surf = false;
refresh_wall_surf  = false;
refresh_light_surf = false;

cam_x = 0;
cam_y = 0;

// Cursor
cursor_spr = sGUI_Cursor_Default;

// Hotbar
hotbar = new __hotbar_class();

// Actor Management
player_create();
heartvine_create(10, 10);
actor_step_queue   = ds_queue_create();
actor_render_queue = ds_queue_create();
block_render_queue = ds_queue_create();