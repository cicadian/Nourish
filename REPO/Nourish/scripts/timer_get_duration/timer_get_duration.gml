/// @func timer_get_duration
/// @arg  {map} timer
/// @desc {real} Returns total duration of the timer
function timer_get_duration() {

	var _timer = argument[0];
	return fuwa_convert_time_toexternal(_timer[? "UNIT"], (_timer[? "TIME_END"] - _timer[? "TIME_START"]));


}
