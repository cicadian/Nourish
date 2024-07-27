if (!global.ready){exit;}

actors_step();

if (input_mouse_wheel_up()){
	hotbar.previous();
}
if (input_mouse_wheel_down()){
	hotbar.next();
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
	wall_surf = surface_create(WORLDSIZE_W * CELLSIZE, WORLDSIZE_H * CELLSIZE);
	surface_set_target(wall_surf);
	draw_clear_alpha(c_black, 0);
	for (var _w = 0; _w < WORLDSIZE_W; _w++){
		for (var _h = 0; _h < WORLDSIZE_H; _h++){
			if (wall_grid[# _w, _h] > -1){
				draw_sprite(sTile_Dev, wall_grid[# _w, _h], _w * CELLSIZE, _h * CELLSIZE);
			}
		}
	}
	surface_reset_target();
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