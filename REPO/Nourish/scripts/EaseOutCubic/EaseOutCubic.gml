/// @description EaseOutCubic(inputvalue,outputmin,outputmax,inputmax)
/// @param inputvalue
/// @param outputmin
/// @param outputmax
/// @param inputmax
function EaseOutCubic(argument0, argument1, argument2, argument3) {

	return argument2 * (power(argument0/argument3 - 1, 3) + 1) + argument1;




}
