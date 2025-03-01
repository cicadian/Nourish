/// @description EaseInOutQuad(inputvalue,outputmin,outputmax,inputmax)
/// @param inputvalue
/// @param outputmin
/// @param outputmax
/// @param inputmax
function EaseInOutQuad(argument0, argument1, argument2, argument3) {

	argument0 /= argument3 * 0.5;

	if (argument0 < 1)
	{
	    return argument2 * 0.5 * argument0 * argument0 + argument1;
	}

	return argument2 * -0.5 * (--argument0 * (argument0 - 2) - 1) + argument1;





}
