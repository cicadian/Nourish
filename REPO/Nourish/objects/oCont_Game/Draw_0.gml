if (surface_exists(floor_surf)){
	draw_surface_part(floor_surf, cam_x, cam_y, WORLDSIZE_W * CELLSIZE_W, WORLDSIZE_H * CELLSIZE_H, 0, 0);
}
if (surface_exists(wall_surf)){
	draw_surface_part(wall_surf, cam_x, cam_y, WORLDSIZE_W * CELLSIZE_W, WORLDSIZE_H * CELLSIZE_H, 0, 0);
}
if (surface_exists(actor_surf)){
	draw_surface_part(actor_surf, cam_x, cam_y, WORLDSIZE_W * CELLSIZE_W, WORLDSIZE_H * CELLSIZE_H, 0, 0);
}

//var _hex;
//var _x_offset = 0;
//for (var _w = 0; _w < WORLDSIZE_W; _w++){
//	for (var _h = 0; _h < WORLDSIZE_H; _h++){
//		_hex = wall_grid[# _w, _h];
//		if (_h mod 2 == 0){
//			_x_offset = CELLSIZE_W / 2;
//		}
//		else{
//			_x_offset = 0;
//		}
//		if (_hex > -1){
//			draw_sprite(sTile_Dev, _hex, _w * CELLSIZE_W + _x_offset, _h * CELLSIZE_H);
//		}
//	}
//}
if (DEV_DRAW_GRID_COORDINATES){
	dev_draw_grid_coordinates();
}