/// @func timer_get_numfinished
/// @desc {real} Returns how many times a timer has finished.
/// @arg  {map} timer
function timer_get_numfinished() {

	var _timer = argument[0];
	return _timer[? "TIMES_FINISHED"];


}
