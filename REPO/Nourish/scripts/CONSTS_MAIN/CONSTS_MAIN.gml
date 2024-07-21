#macro DEPTH_CONT  -1000
#macro DEPTH_ACTOR -100
#macro MAIN        oCont_Main
#macro GAME        oCont_Game
#macro PLAYER      oActor_Player
#macro NATIVE_W    640
#macro NATIVE_H    360
#macro CELLSIZE_W  20
#macro CELLSIZE_H  17 // The actual height of a hex tile is 22, but it tiles by 17
#macro WORLDSIZE_W 20
#macro WORLDSIZE_H 20
#macro DEV_DRAW_GRID_COORDINATES false
#macro KEYMAP_TINYNUM "0123456789"
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
	display_set_gui_size(NATIVE_W * global.window_scale, NATIVE_H * global.window_scale);
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
	global.ready = false;
	
	// Create Fonts
	MAIN.font_tinynum = font_add_sprite_ext(sFont_Tinynum, KEYMAP_TINYNUM, true, 1);
	draw_set_font(MAIN.font_tinynum);
}