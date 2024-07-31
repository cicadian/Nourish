/// @func timer_get_active
/// @desc {bool} Returns whether a timer is active.
/// @arg  {map} timer
function timer_get_active() {

	var _timer = argument[0];
	return _timer[? "ACTIVE"];


}
