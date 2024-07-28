function world_collision_build(){
	world_sprite = sprite_create_from_surface(wall_surf, 0, 0, surface_get_width(wall_surf), surface_get_height(wall_surf), false, false, 0, 0);
	sprite_collision_mask(world_sprite, false, bboxmode_automatic, 0, 0, 0, 0, bboxkind_precise, 0);
	oCont_Game.mask_index = world_sprite;
}