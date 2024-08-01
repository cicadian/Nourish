enum __FLOOR{
	DIRT,
	STONE,
	WATER
}

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
	frame = irandom(3);
	
	saturation = 0;
	nutrition = 0;
	
	update_quality();
	
	static set_type = function(_type){
		type = _type;
		sprite = global.FLOOR_SPRITES[type];
		update_quality();
		GAME.refresh_floor_surf = true;
	}
	static set_frame = function(_frame){
		frame = _frame;
	}
	static update_quality = function(){
		if (type == __FLOOR.WATER){
			saturation = 5;
		}
		else if (type == __FLOOR.DIRT){
			nutrition = 1;
		}
	}
}

function floor_clear(){
	ds_grid_clear(floor_grid, undefined);
	for (var _w = 0; _w < WORLDSIZE_W; _w++){
		for (var _h = 0; _h < WORLDSIZE_H; _h++){
			floor_grid[# _w, _h] = new __floor_class(_w, _h, __FLOOR.DIRT);
		}
	}
}

function floor_set_region(_x1, _y1, _x2, _y2, _type){
	var _width  = _x2 - _x1 + 1;
	var _height = _y2 - _y1 + 1;
	// TOP LEFT TO BOTTOM RIGHT
	var _floor;
	for (var _w = 0; _w < _width; _w++){
		if (_x1 + _w >= WORLDSIZE_W){
			continue;
		}
		for (var _h = 0; _h < _height; _h++){
			if (_y1 + _h >= WORLDSIZE_W){
				continue;
			}
			_floor = floor_grid[# _x1 + _w, _y1 + _h];
			_floor.set_type(_type);
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