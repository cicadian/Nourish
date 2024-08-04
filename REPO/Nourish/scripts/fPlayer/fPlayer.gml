function player_create(){
	player_start_x = 5 * CELLSIZE;
	player_start_y = 5 * CELLSIZE;
	instance_create_layer(player_start_x, player_start_y, global.layer_actor, PLAYER);
}