#macro LIGHT_MAX_VALUE 5
enum __LIGHT_LEVEL{
	NONE,
	DARK,
	DIM,
	MOODY,
	LIT,
	BRIGHT,
	
	__SIZE
}
#macro COLOR_SHADOWS #000510

function __light_class(_x, _y, _value) constructor{
	x = _x;
	y = _y;
	// Always render light levels darkest to brightest
	// Alternatively could use a ds_grid sorted by value instead of redundant arrays
	values_dark   = [];
	values_dim    = [];
	values_moody  = [];
	values_lit    = [];
	values_bright = [];
	values_arr    = [];
	array_push(values_arr, values_dark, values_dim, values_moody, values_lit, values_bright);
}

function light_add(_x, _y, _value, _value_max){
	var _light_inst = new __light_class(_x, _y, _value);
	array_push(GAME.light_arr, _light_inst);
	if (GAME.wall_grid[# _x, _y] > -1){
		return undefined;
	}
	
	// Add starting position
	var _value_array;
	GAME.light_grid[# _x, _y] = min(_value_max, _value);
	switch(min(_value_max, _value)){
		case __LIGHT_LEVEL.DARK:
			_value_array = _light_inst.values_dark;
			break;
		case __LIGHT_LEVEL.DIM:
			_value_array = _light_inst.values_dim;
			break;
		case __LIGHT_LEVEL.MOODY:
			_value_array = _light_inst.values_moody;
			break;
		case __LIGHT_LEVEL.LIT:
			_value_array = _light_inst.values_lit;
			break;
		case __LIGHT_LEVEL.BRIGHT:
			_value_array = _light_inst.values_bright;
			break;
	}
	array_push(_value_array, [_x, _y]);
	
	// Search grid for positions to update lighting
	var _search_inst = new __search_grid_class(_x, _y, _value, false, GAME.wall_grid, -1, __OPERATOR.GREATER);
	_search_inst.search();
	
	// Utilize search results
	var _cells = _search_inst.neighbors;
	var _size = array_length(_cells);
	var _cell, _light_value, _cur_value;
	for (var _i = 0; _i < _size; _i++){
		_cell = _cells[_i];
		_light_value = _search_inst.grid[# _cell[0], _cell[1]].search_radius;
		_cur_value = GAME.light_grid[# _cell[0], _cell[1]];
		if (_cur_value < _light_value){
			GAME.light_grid[# _cell[0], _cell[1]] = min(_value_max, _light_value);
		}
		if (GAME.light_grid[# _cell[0], _cell[1]] > 0){
			var _value_array;
			switch(GAME.light_grid[# _cell[0], _cell[1]]){
				case __LIGHT_LEVEL.DARK:
					_value_array = _light_inst.values_dark;
					break;
				case __LIGHT_LEVEL.DIM:
					_value_array = _light_inst.values_dim;
					break;
				case __LIGHT_LEVEL.MOODY:
					_value_array = _light_inst.values_moody;
					break;
				case __LIGHT_LEVEL.LIT:
					_value_array = _light_inst.values_lit;
					break;
				case __LIGHT_LEVEL.BRIGHT:
					_value_array = _light_inst.values_bright;
					break;
			}
			array_push(_value_array, [_cell[0], _cell[1]]);
		}
	}
	_search_inst.clean();
	GAME.refresh_light_surf = true;
}