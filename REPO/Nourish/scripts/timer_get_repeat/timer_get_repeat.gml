/// @func timer_get_repeat
/// @desc {bool} Returns whether a timer repeats.
/// @arg  {map} timer
function timer_get_repeat() {

	var _timer = argument[0];
	return _timer[? "REPEAT"];


}
