if (surface_exists(floor_surf)){
	draw_surface_part(floor_surf, cam_x, cam_y, WORLDSIZE_W * CELLSIZE_W, WORLDSIZE_H * CELLSIZE_H, 0, 0);
}
if (surface_exists(wall_surf)){
	draw_surface_part(wall_surf, cam_x, cam_y, WORLDSIZE_W * CELLSIZE_W, WORLDSIZE_H * CELLSIZE_H, 0, 0);
}
if (surface_exists(actor_surf)){
	draw_surface_part(actor_surf, cam_x, cam_y, WORLDSIZE_W * CELLSIZE_W, WORLDSIZE_H * CELLSIZE_H, 0, 0);
}

if (DEV_DRAW_GRID_COORDINATES){
	dev_draw_grid_coordinates();
}
if (DEV_DRAW_GRID_VALUE){
	dev_draw_grid_value();
}