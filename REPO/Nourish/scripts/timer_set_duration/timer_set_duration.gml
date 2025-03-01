/// @func timer_set_duration
/// @desc {void} Change the duration of the timer without affecting the start time.
/// @arg {map} timer
/// @arg {real} duration
function timer_set_duration() {

	var _timer = argument[0];
	var _duration = argument[1];

	_timer[? "TIME_END"] = _timer[? "TIME_START"] + fuwa_convert_time_tointernal(_timer[? "UNIT"], _duration);

	fuwa_update_sequence_duration(_timer);



}
