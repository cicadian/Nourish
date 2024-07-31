/// @func timer_get_halted
/// @desc {script} Returns if timer is halted.
/// @arg {map} timer
function timer_get_halted() {

	var _timer = argument[0];

	return _timer[? "PAUSED"];


}
