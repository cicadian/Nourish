actors_draw();

var _hex;
var _x_offset = 0;
for (var _w = 0; _w < 24; _w++){
	for (var _h = 0; _h < 24; _h++){
		_hex = wall_grid[# _w, _h];
		if (_h mod 2 == 0){
			_x_offset = CELLSIZE_W / 2;
		}
		else{
			_x_offset = 0;
		}
		draw_sprite(sTile_Empty, _hex, _w * CELLSIZE_W + _x_offset, _h * CELLSIZE_H);
		if (_hex > -1){
			draw_sprite(sTile_Dev, _hex, _w * CELLSIZE_W + _x_offset, _h * CELLSIZE_H);
		}
	}
}
for (var _w = 0; _w < 24; _w++){
	for (var _h = 0; _h < 24; _h++){
		if (_h mod 2 == 0){
			_x_offset = CELLSIZE_W / 2;
		}
		else{
			_x_offset = 0;
		}
		draw_text_color(_w * CELLSIZE_W + _x_offset + 6, _h * CELLSIZE_H + 8, $"{_w} {_h}", c_maroon, c_dkgray, c_dkgray, c_maroon, 1);
	}
}