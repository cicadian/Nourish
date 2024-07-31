/// @description  int mround_min (int num, int multiple)
/// @arg {real} num
/// @arg {real} multiple
function fuwa_mround_min() {
	// rounds to the smallest multiple of a number

	var num = argument[0];
	var multiple = argument[1];

	return multiple * floor((num / multiple));



}
