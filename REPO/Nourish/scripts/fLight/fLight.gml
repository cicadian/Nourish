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
enum __LIGHT_COLOR{
	BLUE,
	GREEN
}
#macro COLOR_SHADOWS #000510

function __light_class(_x, _y, _value, _color) constructor{
	x = _x;
	y = _y;
	color = _color;
	value_arr = [];
}

function light_add(_x, _y, _value, _color){
	var _light_inst = new __light_class(_x, _y, _value, _color);
	array_push(GAME.light_arr, _light_inst);
	if (GAME.wall_grid[# _x, _y] == -1){
		GAME.light_grid[# _x, _y] = min(LIGHT_MAX_VALUE, _value);
		var _inst = new __search_grid_class(_x, _y, _value, true, GAME.wall_grid, -1, __OPERATOR.GREATER);
		_inst.search();
		var _cells = array_concat(_inst.neighbors, _inst.edges);
		var _size = array_length(_cells);
		var _cell, _light_value, _cur_value;
		for (var _i = 0; _i < _size; _i++){
			_cell = _cells[_i];
			_light_value = _inst.grid[# _cell[0], _cell[1]].search_radius;
			_cur_value = GAME.light_grid[# _cell[0], _cell[1]];
			GAME.light_grid[# _cell[0], _cell[1]] = clamp(_cur_value + _light_value, 0, LIGHT_MAX_VALUE);
			array_push(_light_inst.value_arr, GAME.light_grid[# _cell[0], _cell[1]]);
		}
		_inst.clean();
	}
}