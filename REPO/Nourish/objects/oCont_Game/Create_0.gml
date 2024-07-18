player_create();
actor_step_queue   = ds_queue_create();
actor_render_queue = ds_queue_create();

wall_grid = ds_grid_create(24, 24);
ds_grid_clear(wall_grid, -1);

wall_arr = [];

wall_add(3,3);
wall_add(4,3);
wall_add(5,3);
wall_add(3,4);

repeat(300){
	wall_add(irandom(23), irandom(23));
}