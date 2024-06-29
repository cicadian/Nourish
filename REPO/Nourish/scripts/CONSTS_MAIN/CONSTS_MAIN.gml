#macro DEPTH_CONT  -1000
#macro DEPTH_ACTOR -100
#macro MAIN        oCont_Main
#macro GAME        oCont_Game
#macro PLAYER      oActor_Player
#macro NATIVE_W    640
#macro NATIVE_H    360
show_debug_message($"###### Constants defined from {script_get_name(CONSTS_MAIN)}. ######");

setup();

function setup(){
	static __initialized = false;
	if (__initialized) {return;}
	__initialized = true;
	
	var _load_time = current_time;
	
	// Setup game window
	application_surface_draw_enable(false);
	global.window_scale = (display_get_width() div NATIVE_W) - 1;
	window_set_size(NATIVE_W * global.window_scale, NATIVE_H * global.window_scale);
	window_center();
	
	global.setup = true;
	_load_time = current_time - _load_time;
	show_debug_message($"###### Setup complete in {_load_time} milliseconds. ######");
}

function setup_controllers(){ // Run in Room1 Creation Code
	static __initialized = false;
	if (__initialized) {return;}
	__initialized = true;
	
	// Create Layers
	global.layer_cont  = layer_create(DEPTH_CONT,  "CONT");
	global.layer_actor = layer_create(DEPTH_ACTOR, "ACTOR");

	// Create Controllers
	instance_create_layer(0, 0, global.layer_cont, MAIN);
	instance_create_layer(0, 0, global.layer_cont, GAME);
	MAIN.alarm[0] = 1;
}