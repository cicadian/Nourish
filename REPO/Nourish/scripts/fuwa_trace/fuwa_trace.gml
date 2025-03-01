/// @func fuwa_trace
/// @arg {any} argument0
/// @arg {any*} argument1...
function fuwa_trace() {

	var _message = "fuwafuwa: " + string(argument[0]);

	for (var i = 1; i < argument_count; i++){
	    _message += ", " + string(argument[i]);
	}

	var _objName = object_get_name(object_index)
	_message += " [" + fuwa_script_called(true);
	if (string_count(_objName,_message) == 0){
		_message += "@" + _objName;
	}
	_message += "]";

	show_debug_message(_message);



}
