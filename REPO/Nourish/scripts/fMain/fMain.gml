function gamepads_init(){
	global.gamepad_array = [];
	var _gp_num = gamepad_get_device_count();
	for (var _i = 0; _i < _gp_num; _i++){
		if (gamepad_is_connected(_i)){
			array_push(global.gamepad_array, _i);
		}
	}
	global.ready = true;
}