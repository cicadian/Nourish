function wall_add(_x, _y){
	wall_grid[# _x, _y] = 0;
	wall_autotile_update(_x, _y);

	var _bitmask = get_bitmask(_x, _y);
	wall_grid[# _x, _y] = lookup_bitmask(_bitmask);
}
function wall_remove(_x, _y){
	wall_grid[# _x, _y] = -1;
	wall_autotile_update(_x, _y);
}
function wall_add_circle(_x, _y, _radius){
	wall_grid[# _x, _y] = 0;
	wall_autotile_update(_x, _y);
	
	var _cells = wall_get_neighbors(_x, _y, _radius);
	var _size = array_length(_cells);
	var _cell;
	for (var _i = 0; _i < _size; _i++){
		_cell = _cells[_i];
		wall_add(_cell[0], _cell[1]);
	}
	
	var _bitmask = get_bitmask(_x, _y);
	wall_grid[# _x, _y] = lookup_bitmask(_bitmask);
}
function wall_remove_circle(_x, _y, _radius){
	wall_remove(_x, _y);
	var _cells = wall_get_neighbors(_x, _y, _radius);
	var _size  = array_length(_cells);
	var _cell;
	for (var _i = 0; _i < _size; _i++){
		_cell = _cells[_i];
		wall_remove(_cell[0], _cell[1]);
	}
}
function wall_autotile_update(_x, _y){
	var _neighbors = wall_get_neighbors(_x, _y, 1);
	var _size = array_length(_neighbors);
	var _cell;
	var _bitmask;
	for (var _i = 0; _i < _size; _i++){
		_cell = _neighbors[_i];
		if (wall_grid[# _cell[0], _cell[1]] > -1){
			_bitmask = get_bitmask(_cell[0], _cell[1]);
			wall_grid[# _cell[0], _cell[1]] = lookup_bitmask(_bitmask);
		}
	}
}

function wall_get_neighbors(_x, _y, _radius){
	var _inst = new __search_grid_class(_x, _y, _radius, true);
	_inst.search();
	_inst.clean();
	return _inst.neighbors;
}