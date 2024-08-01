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
	floor_surf = surface_create(WORLDSIZE_W * CELLSIZE, WORLDSIZE_H * CELLSIZE);
	surface_set_target(floor_surf);
	draw_clear_alpha(c_black, 1);
	for (var _w = 0; _w < WORLDSIZE_W; _w++){
		for (var _h = 0; _h < WORLDSIZE_H; _h++){
			draw_sprite(sFloor_Dirt, irandom(3), _w * CELLSIZE, _h * CELLSIZE);
		}
	}
	surface_reset_target();
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
	light_surf_0 = surface_create(WORLDSIZE_W * CELLSIZE, WORLDSIZE_H * CELLSIZE);
	surface_set_target(light_surf_0);
	draw_clear_alpha(c_black, 0);
	// Draw white light values from the light grid
	var _num_lights = array_length(GAME.light_arr);
	var _light, _num_arrays, _value_array, _num_points, _point, _lightgrid_value, _light_level;
	for (var _i = 0; _i < _num_lights; _i++){
		_light = GAME.light_arr[_i];
		var _num_arrays = array_length(_light.values_arr);
		for (var _j = 0; _j < _num_arrays; _j++){
			_value_array = _light.values_arr[_j];
			_num_points = array_length(_value_array);
			for (var _k = 0; _k < _num_points; _k++){
				_point = _value_array[_k];
				draw_sprite(sTile_Lightbrush, 4, _point[0] * CELLSIZE, _point[1] * CELLSIZE);
			}
		}
	}
	surface_reset_target();
}
if (!surface_exists(light_surf_1)){
	light_surf_1 = surface_create(WORLDSIZE_W * CELLSIZE, WORLDSIZE_H * CELLSIZE);
	surface_set_target(light_surf_1);
	draw_clear_alpha(c_black, 0);
	// Draw white light values from the light grid
	var _num_lights = array_length(GAME.light_arr);
	var _light, _num_arrays, _value_array, _num_points, _point, _lightgrid_value, _light_level;
	for (var _i = 0; _i < _num_lights; _i++){
		_light = GAME.light_arr[_i];
		var _num_arrays = array_length(_light.values_arr);
		for (var _j = 1; _j < _num_arrays; _j++){
			_value_array = _light.values_arr[_j];
			_num_points = array_length(_value_array);
			for (var _k = 0; _k < _num_points; _k++){
				_point = _value_array[_k];
				draw_sprite(sTile_Lightbrush, 4, _point[0] * CELLSIZE, _point[1] * CELLSIZE);
			}
		}
	}
	surface_reset_target();
}
if (!surface_exists(light_surf_2)){
	light_surf_2 = surface_create(WORLDSIZE_W * CELLSIZE, WORLDSIZE_H * CELLSIZE);
	surface_set_target(light_surf_2);
	draw_clear_alpha(c_black, 0);
	// Draw white light values from the light grid
	var _num_lights = array_length(GAME.light_arr);
	var _light, _num_arrays, _value_array, _num_points, _point, _lightgrid_value, _light_level;
	for (var _i = 0; _i < _num_lights; _i++){
		_light = GAME.light_arr[_i];
		var _num_arrays = array_length(_light.values_arr);
		for (var _j = 2; _j < _num_arrays; _j++){
			_value_array = _light.values_arr[_j];
			_num_points = array_length(_value_array);
			for (var _k = 0; _k < _num_points; _k++){
				_point = _value_array[_k];
				draw_sprite(sTile_Lightbrush, 4, _point[0] * CELLSIZE, _point[1] * CELLSIZE);
			}
		}
	}
	surface_reset_target();
}
if (!surface_exists(light_surf_3)){
	light_surf_3 = surface_create(WORLDSIZE_W * CELLSIZE, WORLDSIZE_H * CELLSIZE);
	surface_set_target(light_surf_3);
	draw_clear_alpha(c_black, 0);
	// Draw white light values from the light grid
	var _num_lights = array_length(GAME.light_arr);
	var _light, _num_arrays, _value_array, _num_points, _point, _lightgrid_value, _light_level;
	for (var _i = 0; _i < _num_lights; _i++){
		_light = GAME.light_arr[_i];
		var _num_arrays = array_length(_light.values_arr);
		for (var _j = 3; _j < _num_arrays; _j++){
			_value_array = _light.values_arr[_j];
			_num_points = array_length(_value_array);
			for (var _k = 0; _k < _num_points; _k++){
				_point = _value_array[_k];
				draw_sprite(sTile_Lightbrush, 4, _point[0] * CELLSIZE, _point[1] * CELLSIZE);
			}
		}
	}
	surface_reset_target();
}
if (!surface_exists(light_surf_4)){
	light_surf_4 = surface_create(WORLDSIZE_W * CELLSIZE, WORLDSIZE_H * CELLSIZE);
	surface_set_target(light_surf_4);
	draw_clear_alpha(c_black, 0);
	// Draw white light values from the light grid
	var _num_lights = array_length(GAME.light_arr);
	var _light, _num_arrays, _value_array, _num_points, _point, _lightgrid_value, _light_level;
	for (var _i = 0; _i < _num_lights; _i++){
		_light = GAME.light_arr[_i];
		var _num_arrays = array_length(_light.values_arr);
		for (var _j = 4; _j < _num_arrays; _j++){
			_value_array = _light.values_arr[_j];
			_num_points = array_length(_value_array);
			for (var _k = 0; _k < _num_points; _k++){
				_point = _value_array[_k];
				draw_sprite(sTile_Lightbrush, 4, _point[0] * CELLSIZE, _point[1] * CELLSIZE);
			}
		}
	}
	surface_reset_target();
}

if (!surface_exists(shadow_surf)){
	// Ambient Shadow, (fog color) this color is 100% opaque where there is no light
	shadow_surf = surface_create(WORLDSIZE_W * CELLSIZE, WORLDSIZE_H * CELLSIZE);
	surface_set_target(shadow_surf);
	draw_clear_alpha(COLOR_SHADOWS, 1);
	gpu_set_blendmode(bm_subtract);
	draw_surface_ext(light_surf_0, 0, 0, 1, 1, 0, c_white, 0.3);
	draw_surface_ext(light_surf_1, 0, 0, 1, 1, 0, c_white, 0.6);
	draw_surface_ext(light_surf_2, 0, 0, 1, 1, 0, c_white, 0.75);
	draw_surface_ext(light_surf_3, 0, 0, 1, 1, 0, c_white, 0.85);
	gpu_set_blendmode(bm_normal);
	surface_reset_target();
}
else if (refresh_light_surf){
	surface_set_target(shadow_surf);
	
	surface_reset_target();
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