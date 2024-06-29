function player_create(){
	player_start_x = 100;
	player_start_y = 100;
	instance_create_layer(player_start_x, player_start_y, global.layer_actor, PLAYER);
	show_debug_message("player created");
}