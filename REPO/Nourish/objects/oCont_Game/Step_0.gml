if (!global.ready){exit;}

actors_step();

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
	surface_reset_target();
}
else{
	if (refresh_actor_surf){
		surface_set_target(actor_surf);
		draw_clear_alpha(c_black, 0);
		actors_draw();
		surface_reset_target();
	}
}
if (!surface_exists(light_surf)){
	light_surf = surface_create(WORLDSIZE_W * CELLSIZE, WORLDSIZE_H * CELLSIZE);
	surface_set_target(light_surf);
	draw_clear_alpha(COLOR_SHADOWS, 1);
	var _value, _spr;
	_spr = sTile_Light_Blue;
	for (var _w = 0; _w < WORLDSIZE_W; _w++){
		for (var _h = 0; _h < WORLDSIZE_H; _h++){
			_value = light_grid[# _w, _h];
			if (_value > 0){
				gpu_set_blendmode(bm_subtract);
				draw_sprite_ext(sTile_Light, _value, _w * CELLSIZE, _h * CELLSIZE, 1, 1, 0, c_black, 1);
				if (_value < 5){
					gpu_set_blendmode(bm_add);
					draw_sprite_ext(_spr, _value, _w * CELLSIZE, _h * CELLSIZE, 1, 1, 0, c_white, 0.325);
				}
				else{
					gpu_set_blendmode(bm_subtract);
					draw_sprite_ext(sTile_Light, _value, _w * CELLSIZE, _h * CELLSIZE, 1, 1, 0, c_white, 1);
				}
			}
		}
	}
	gpu_set_blendmode(bm_normal);
	surface_reset_target();
}
else{
	if (refresh_light_surf){
		surface_set_target(light_surf);
		//draw_clear_alpha(c_black, 1);
		
		surface_reset_target();
	}
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