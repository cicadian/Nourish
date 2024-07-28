#macro LIGHT_MAX_VALUE 4
enum __LIGHT_LEVEL{
	NONE,
	DARK,
	DIM,
	LIT,
	BRIGHT,
	
	__SIZE
}

function light_add(_x, _y, _value){
	if (GAME.wall_grid[# _x, _y] == -1){
		GAME.light_grid[# _x, _y] = min(LIGHT_MAX_VALUE + 1, _value);
		var _inst = new __search_grid_class(_x, _y, _value - 1, true, GAME.wall_grid, -1, __OPERATOR.GREATER);
		_inst.search();
		var _size = array_length(_inst.neighbors);
		var _cell, _light_value;
		for (var _i = 0; _i < _size; _i++){
			_cell = _inst.neighbors[_i];
			_light_value = _inst.grid[# _cell[0], _cell[1]][1];
			GAME.light_grid[# _cell[0], _cell[1]] = clamp(GAME.light_grid[# _cell[0], _cell[1]] + _light_value, 0, LIGHT_MAX_VALUE);
		}
		_inst.clean();
	}
}