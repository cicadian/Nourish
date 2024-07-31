/// @func timer_get_unit
/// @desc {enum} Returns the timer unit.
/// @arg  {map} timer
function timer_get_unit() {

	var _timer = argument[0];
	return _timer[? "UNIT"];


}
