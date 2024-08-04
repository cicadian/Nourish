function render_floor(){
	floor_surf = surface_create(WORLDSIZE_W * CELLSIZE, WORLDSIZE_H * CELLSIZE);
	surface_set_target(floor_surf);
	draw_clear_alpha(c_black, 1);
	var _floor;
	for (var _w = 0; _w < WORLDSIZE_W; _w++){
		for (var _h = 0; _h < WORLDSIZE_H; _h++){
			_floor = floor_grid[# _w, _h];
			draw_sprite(_floor.sprite, _floor.frame, _w * CELLSIZE, _h * CELLSIZE);
			draw_sprite(sTile_Water, _floor.water_level, _w * CELLSIZE, _h * CELLSIZE);
		}
	}
	surface_reset_target();
}

function render_lights(){
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

function render_shadows(){
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