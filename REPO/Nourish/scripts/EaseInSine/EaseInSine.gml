/// @description EaseInSine(inputvalue,outputmin,outputmax,inputmax)
/// @param inputvalue
/// @param outputmin
/// @param outputmax
/// @param inputmax
function EaseInSine(argument0, argument1, argument2, argument3) {

	return argument2 * (1 - cos(argument0 / argument3 * (pi / 2))) + argument1;




}
