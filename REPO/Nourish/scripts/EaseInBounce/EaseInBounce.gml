/// @description EaseInBounce(inputvalue,outputmin,outputmax,inputmax)
/// @param inputvalue
/// @param outputmin
/// @param outputmax
/// @param inputmax
function EaseInBounce(argument0, argument1, argument2, argument3) {

	return argument2 - EaseOutBounce(argument3 - argument0, 0, argument2, argument3) + argument1




}
