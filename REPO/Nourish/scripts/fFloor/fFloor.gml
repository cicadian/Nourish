enum __FLOOR{
	DIRT,
	STONE,
}

#macro WATER_MAX 10

global.FLOOR_SPRITES = [
	sTile_Dirt,
	sTile_Stone,
	sTile_Water
];

function __floor_class(_x, _y, _type) constructor{
	x = _x;
	y = _y;
	type = _type;
	sprite = global.FLOOR_SPRITES[type];
	frame = 0;
	
	saturation = 0;
	nutrition = 0;
	
	channeled = false;
	water_level = 0;
	
	adjacent_arr = [undefined, undefined, undefined, undefined];
	
	update_quality();
	
	static set_type = function(_type){
		type = _type;
		sprite = global.FLOOR_SPRITES[type];
		update_quality();
		GAME.refresh_floor_surf = true;
	}
	static set_adjacent = function(_dir4, _floor){
		adjacent_arr[_dir4] = _floor;
	}
	static update_quality = function(){
		if (type == __FLOOR.DIRT){
			nutrition = 1;
		}
	}
	static set_frame = function(_frame){
		frame = _frame;
	}
	static channel = function(){
		channeled = true;
		frame = 1;
		GAME.refresh_floor_surf = true;
	}
	static fill = function(){
		channeled = false;
		frame = 0;
		GAME.refresh_floor_surf = true;
	}
	static set_water_level = function(_water_level){
		water_level = _water_level;
		var _index = array_get_index(GAME.water_update_arr, self);
		if (water_level > 1){
			if (_index == -1){
				array_push(GAME.water_update_arr, self);
			}
		}
		else{
			if (_index != -1){
				// this is being run in the for loop! please delete this at another point!
				array_delete(GAME.water_update_arr, _index, 1);
			}
		}
		GAME.refresh_floor_surf = true;
	}
	static flow = function(){
		var _cell;
		for (var _i = 0; _i < 4; _i++){
			_cell = adjacent_arr[_i];
			if (_cell == undefined){continue};
			if (!_cell.channeled){continue};
			if (water_level <= 1){continue};
			if (water_level <= _cell.water_level){continue};
			set_water_level(water_level - 1);
			_cell.set_water_level(_cell.water_level + 1);
		}
	}
}
// TODO generalize if possible
function floor_clear(){
	ds_grid_clear(floor_grid, undefined);
	for (var _w = 0; _w < WORLDSIZE_W; _w++){
		for (var _h = 0; _h < WORLDSIZE_H; _h++){
			floor_grid[# _w, _h] = new __floor_class(_w, _h, __FLOOR.DIRT);
		}
	}
	floor_set_adjacents();
}

function floor_set_adjacents(){
	var _cell;
	for (var _w = 0; _w < WORLDSIZE_W; _w++){
		for (var _h = 0; _h < WORLDSIZE_H; _h++){
			_cell = floor_grid[# _w, _h];
			if (_w + 1 < WORLDSIZE_W){
				_cell.set_adjacent(__DIR4.EAST, floor_grid[# _w + 1, _h]);
			}
			if (_h - 1 > 0){
				_cell.set_adjacent(__DIR4.NORTH, floor_grid[# _w, _h - 1]);
			}
			if (_w - 1 > 0){
				_cell.set_adjacent(__DIR4.WEST, floor_grid[# _w - 1, _h]);
			}
			if (_h + 1 < WORLDSIZE_H){
				_cell.set_adjacent(__DIR4.SOUTH, floor_grid[# _w, _h + 1]);
			}
		}
	}
}

function ds_grid_modify_region(_grid, _x1, _y1, _x2, _y2, _function, _arguments_arr){
	var _width  = _x2 - _x1 + 1;
	var _height = _y2 - _y1 + 1;
	var _grid_width = ds_grid_width(_grid);
	var _grid_height = ds_grid_height(_grid);

	var _cell;
	for (var _w = 0; _w < _width; _w++){
		if (ds_grid_get_max(_grid, _w, 0, _w, _height - 1) == 0) {continue};
		if (_x1 + _w >= _grid_width){
			continue;
		}
		for (var _h = 0; _h < _height; _h++){
			if (ds_grid_get_max(_grid, 0, _h, _width - 1, _h) == 0) {continue};
			if (_y1 + _h >= _grid_height){
				continue;
			}
			_cell = _grid[# _x1 + _w, _y1 + _h]
			with (_cell){;
				if (is_string(_function)){
					method_call(struct_get(_cell, _function), _arguments_arr);
				}
				else{
					script_execute_ext(_function, _arguments_arr);
				}
			}
		}
	}
}

function ds_grid_modify_region_ext(_grid, _x1, _y1, _x2, _y2, _function_arr, _arguments_arr_arr){
	var _width  = _x2 - _x1 + 1;
	var _height = _y2 - _y1 + 1;
	var _grid_width = ds_grid_width(_grid);
	var _grid_height = ds_grid_height(_grid);

	var _cell, _function, _arguments_arr;
	var _size = array_length(_function_arr);
	for (var _w = 0; _w < _width; _w++){
		if (_x1 + _w >= _grid_width){
			continue;
		}
		for (var _h = 0; _h < _height; _h++){
			if (_y1 + _h >= _grid_height){
				continue;
			}
			_cell = _grid[# _x1 + _w, _y1 + _h]
			with (_cell){;
				for (var _i = 0; _i < _size; _i++){
					_function = _function_arr[_i];
					_arguments_arr = _arguments_arr_arr[_i];
					if (is_string(_function)){
						method_call(struct_get(_cell, _function), _arguments_arr);
					}
					else{
						script_execute_ext(_function, _arguments_arr);
					}
				}
			}
		}
	}
}

function floor_set_disc(_x, _y, _radius, _type){
	var _start_x = _x - _radius;
	var _start_y = _y - _radius;
	var _width  = _radius * 2;
	var _height = _radius * 2;

	// TOP LEFT TO BOTTOM RIGHT
	var _floor, _in_range;
	for (var _w = 0; _w < _width; _w++){
		if (_start_x + _w < 0 || _start_x + _w >= WORLDSIZE_W){
			continue;
		}
		for (var _h = 0; _h < _height; _h++){
			if (_start_y + _h < 0 || _start_y + _h >= WORLDSIZE_H){
				continue;
			}
			_in_range = point_distance(_start_x + _w, _start_y + _h, _x, _y) <= _radius;
			if (_in_range){
				_floor = floor_grid[# _start_x + _w, _start_y + _h];
				_floor.set_type(_type);
			}
		}
	}
}