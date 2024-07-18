function wall_add(_x, _y){
	wall_grid[# _x, _y] = 0;
	array_push(wall_arr, [_x, _y]);
	
	var _hex_arr = hexgrid_get_neighbors(_x, _y);
	var _size = array_length(_hex_arr);
	var _cell;
	var _bitmask
	for (var _i = 0; _i < _size; _i++){
		_cell = _hex_arr[_i];
		_bitmask = hexgrid_get_bitmask(_cell[0], _cell[1]);
		wall_grid[# _cell[0], _cell[1]] = hexgrid_lookup_bitmask(_bitmask);
	}
	_bitmask = hexgrid_get_bitmask(_x, _y);
	wall_grid[# _x, _y] = hexgrid_lookup_bitmask(_bitmask);
}