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

// Floors
floor_grid = ds_grid_create(WORLDSIZE_W, WORLDSIZE_H);
floor_clear();

var _x, _y;
repeat(32){
	_x = irandom(WORLDSIZE_W - 1);
	_y = irandom(WORLDSIZE_H - 1);
	var _floor_inst = new __floor_class(-1, -1, __FLOOR.DIRT);
	ds_grid_modify_region(floor_grid, _x, _y, _x + irandom(2), _y + irandom(2), _floor_inst.set_type, [__FLOOR.STONE]);
}
//floor_set_disc(1, 1, 3.5, __FLOOR.STONE);
//ds_grid_set_disk(floor_grid, 8, 12, 2.5, __FLOOR.STONE);
//ds_grid_set_disk(floor_grid, 10, 13, 2.5, __FLOOR.STONE);
//ds_grid_set_disk(floor_grid, 15, 15, 2.5, __FLOOR.STONE);

// Lighting
light_grid = ds_grid_create(WORLDSIZE_W, WORLDSIZE_H);
ds_grid_clear(light_grid, 0);
light_arr = [];

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
refresh_floor_surf = false;
refresh_actor_surf = false;
refresh_wall_surf  = false;
refresh_light_surf = false;

// Camera
cam_x = 0;
cam_y = 0;

// Cursor
cursor_spr = sGUI_Cursor_Default;
mouse_grid_x = 0;
mouse_grid_y = 0;

// Hotbar
hotbar = new __hotbar_class();

// Actor Management
player_create();
heartvine_create(5, 5);
actor_step_queue   = ds_queue_create();
actor_render_queue = ds_queue_create();
block_render_queue = ds_queue_create();

// Inspector
inspect_data = floor_grid[# 0, 0];