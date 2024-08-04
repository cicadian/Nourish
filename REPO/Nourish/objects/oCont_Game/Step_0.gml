if (!global.ready){exit;}

// Manage Actors
actors_step();

// Update Hotbar
if (input_mouse_wheel_up()){
	hotbar.previous();
}
if (input_mouse_wheel_down()){
	hotbar.next();
}
if (input_check_pressed("slot_one")){
	hotbar.choice = 0;
}
if (input_check_pressed("slot_two")){
	hotbar.choice = 1;
}
if (input_check_pressed("slot_three")){
	hotbar.choice = 2;
}
if (input_check_pressed("slot_four")){
	hotbar.choice = 3;
}

// Rebuild Surfaces
if (!surface_exists(floor_surf)){
	render_floor();
}
else if (refresh_floor_surf){
	render_floor();
	refresh_floor_surf = false;
}
if (!surface_exists(wall_surf)){
	if (sprite_exists(world_sprite)){
		sprite_delete(world_sprite);
	}
	world_sprite = undefined;
	wall_surf = surface_create(WORLDSIZE_W * CELLSIZE, WORLDSIZE_H * CELLSIZE);
	surface_set_target(wall_surf);
	draw_clear_alpha(c_black, 0);
	for (var _w = 0; _w < WORLDSIZE_W; _w++){
		for (var _h = 0; _h < WORLDSIZE_H; _h++){
			if (GAME.wall_grid[# _w, _h] > -1){
				draw_sprite(sTile_Dev, GAME.wall_grid[# _w, _h], _w * CELLSIZE, _h * CELLSIZE);
			}
		}
	}
	surface_reset_target();
	world_collision_build();
}
else if (refresh_wall_surf){
	if (sprite_exists(world_sprite)){
		sprite_delete(world_sprite);
	}
	world_sprite = undefined;
	wall_surf = surface_create(WORLDSIZE_W * CELLSIZE, WORLDSIZE_H * CELLSIZE);
	surface_set_target(wall_surf);
	draw_clear_alpha(c_black, 0);
	for (var _w = 0; _w < WORLDSIZE_W; _w++){
		for (var _h = 0; _h < WORLDSIZE_H; _h++){
			if (GAME.wall_grid[# _w, _h] > -1){
				draw_sprite(sTile_Dev, GAME.wall_grid[# _w, _h], _w * CELLSIZE, _h * CELLSIZE);
			}
		}
	}
	surface_reset_target();
	world_collision_build();
	refresh_wall_surf = false;
}
if (!surface_exists(actor_surf)){
	actor_surf = surface_create(WORLDSIZE_W * CELLSIZE, WORLDSIZE_H * CELLSIZE);
	surface_set_target(actor_surf);
	draw_clear_alpha(c_black, 0);
	actors_draw();
	blocks_draw();
	surface_reset_target();
}
else{
	if (refresh_actor_surf){
		surface_set_target(actor_surf);
		draw_clear_alpha(c_black, 0);
		actors_draw();
		blocks_draw();
		surface_reset_target();
	}
}

if (!surface_exists(light_surf_0)){
	render_lights();
}
else if (refresh_light_surf){
	render_lights();
}

if (!surface_exists(shadow_surf)){
	render_shadows();
}
else if (refresh_light_surf){
	render_shadows();
	refresh_light_surf = false;
}

if (DEV_MODE){
	if (!surface_exists(debug_surf)){
		debug_surf = surface_create(WORLDSIZE_W * CELLSIZE, WORLDSIZE_H * CELLSIZE);
		surface_set_target(debug_surf);
		draw_clear_alpha(c_black, 0);
		if (DEV_DRAW_GRID_COORDINATES){
			dev_draw_grid_coordinates();
		}
		if (DEV_DRAW_GRID_VALUE){
			dev_draw_grid_value();
		}
		surface_reset_target();
	}
}
mouse_grid_x = clamp(mouse_x div CELLSIZE, 0, WORLDSIZE_W - 1);
mouse_grid_y = clamp(mouse_y div CELLSIZE, 0, WORLDSIZE_H - 1);
inspect_data = floor_grid[# mouse_grid_x, mouse_grid_y];

if (flow_update_counter >= flow_update_counter_max){
	var _cell;
	var _size = array_length(water_update_arr);
	if (_size > 0){
		array_shuffle_ext(water_update_arr);
	}
	for (var _i = 0; _i < _size; _i++){
		_cell = water_update_arr[_i];
		_cell.flow();
	}
	flow_update_counter = -1;
}
flow_update_counter++;