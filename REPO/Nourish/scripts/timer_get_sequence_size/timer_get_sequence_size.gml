/// @func timer_get_sequence_size
/// @desc {real} Get the number of nodes in the sequence
/// @arg {map} timer
function timer_get_sequence_size() {

	var _timer = argument[0];
	return array_height_2d(_timer[? "SEQUENCE"]);


}
