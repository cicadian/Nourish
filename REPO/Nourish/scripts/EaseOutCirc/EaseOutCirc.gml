/// @description EaseOutCirc(inputvalue,outputmin,outputmax,inputmax)
/// @param inputvalue
/// @param outputmin
/// @param outputmax
/// @param inputmax
function EaseOutCirc(argument0, argument1, argument2, argument3) {

	argument0 = argument0 / argument3 - 1;
	return argument2 * sqrt(1 - argument0 * argument0) + argument1;




}
