if (!global.ready){exit;}

actors_step();

if (!surface_exists(floor_surf)){
	floor_surf = surface_create(WORLDSIZE_W * CELLSIZE_W, WORLDSIZE_H * CELLSIZE_H);
	surface_set_target(floor_surf);
	draw_clear_alpha(c_black, 1);
	var _x_offset;
	for (var _w = 0; _w < WORLDSIZE_W; _w++){
		for (var _h = 0; _h < WORLDSIZE_H; _h++){
			if (is_even(_h)){
				_x_offset = CELLSIZE_W / 2;
			}
			else{
				_x_offset = 0;
			}
			draw_sprite(sFloor_Dirt, irandom(3), _w * CELLSIZE_W + _x_offset, _h * CELLSIZE_H);
		}
	}
	surface_reset_target();
}
if (!surface_exists(wall_surf)){
	wall_surf = surface_create(WORLDSIZE_W * CELLSIZE_W, WORLDSIZE_H * CELLSIZE_H);
	surface_set_target(wall_surf);
	draw_clear_alpha(c_black, 0);
	var _x_offset;
	for (var _w = 0; _w < WORLDSIZE_W; _w++){
		for (var _h = 0; _h < WORLDSIZE_H; _h++){
			if (is_even(_h)){
				_x_offset = CELLSIZE_W / 2;
			}
			else{
				_x_offset = 0;
			}
			if (wall_grid[# _w, _h] > -1){
				draw_sprite(sWall_Dirt, 0, _w * CELLSIZE_W + _x_offset, _h * CELLSIZE_H);
			}
		}
	}
	surface_reset_target();
}
if (!surface_exists(actor_surf)){
	actor_surf = surface_create(WORLDSIZE_W * CELLSIZE_W, WORLDSIZE_H * CELLSIZE_H);
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