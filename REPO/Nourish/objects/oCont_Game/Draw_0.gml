if (surface_exists(floor_surf)){
	draw_surface_part(floor_surf, cam_x, cam_y, WORLDSIZE_W * CELLSIZE, WORLDSIZE_H * CELLSIZE, 0, 0);
}
if (surface_exists(wall_surf)){
	draw_surface_part(wall_surf, cam_x, cam_y, WORLDSIZE_W * CELLSIZE, WORLDSIZE_H * CELLSIZE, 0, 0);
}
if (surface_exists(actor_surf)){
	draw_surface_part(actor_surf, cam_x, cam_y, WORLDSIZE_W * CELLSIZE, WORLDSIZE_H * CELLSIZE, 0, 0);
}
if (surface_exists(light_surf)){
	draw_surface_part(light_surf, cam_x, cam_y, WORLDSIZE_W * CELLSIZE, WORLDSIZE_H * CELLSIZE, 0, 0);
}
if (DEV_MODE){
	if (surface_exists(debug_surf)){
		draw_surface_part(debug_surf, cam_x, cam_y, WORLDSIZE_W * CELLSIZE, WORLDSIZE_H * CELLSIZE, 0, 0);
	}
}