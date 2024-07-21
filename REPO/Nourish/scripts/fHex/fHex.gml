function hexgrid_get_bitmask(_x, _y){
	var _right      = true;
	var _right_up   = true;
	var _left_up    = true;
	var _left       = true;
	var _left_down  = true;
	var _right_down = true;
	if (is_even(_y)){ // Even Rows
		if (_x + 1 < WORLDSIZE_W){
			_right = wall_grid[# _x + 1, _y] != -1;
			if (_y - 1 >= 0){
				_right_up = wall_grid[# _x + 1, _y - 1] != -1;
			}
			if (_y + 1 < WORLDSIZE_H){
				_right_down = wall_grid[# _x + 1, _y + 1] != -1;
			}
		}
		if (_x - 1 >= 0){
			_left = wall_grid[# _x - 1, _y] != -1;
		}
		if (_y - 1 >= 0){
			_left_up = wall_grid[# _x, _y - 1] != -1;
		}
		if (_y + 1 < WORLDSIZE_H){
			_left_down = wall_grid[# _x, _y + 1] != -1;
		}
	}
	else{ // Odd Rows
		if (_x + 1 < WORLDSIZE_W){
			_right = wall_grid[# _x + 1, _y] != -1;
		}
		if (_x - 1 >= 0){
			_left = wall_grid[# _x - 1, _y] != -1;
			if (_y - 1 >= 0){
				_left_up = wall_grid[# _x - 1, _y - 1] != -1;
			}
			if (_y + 1 < WORLDSIZE_H){
				_left_down = wall_grid[# _x - 1, _y + 1] != -1;
			}
		}
		if (_y - 1 >= 0){
			_right_up = wall_grid[# _x, _y - 1] != -1;
		}
		if (_y + 1 < WORLDSIZE_H){
			_right_down = wall_grid[# _x, _y + 1] != -1;
		}
	}
	var _bitmask = 0;
	_bitmask += _right;
	_bitmask += _right_up   * 2;
	_bitmask += _left_up    * 4;
	_bitmask += _left       * 8;
	_bitmask += _left_down  * 16;
	_bitmask += _right_down * 32;
	return _bitmask;
}

function hexgrid_lookup_bitmask(_bitmask){
	var _frame;
	switch (_bitmask){
		case 0:
			_frame = 0; // Alone
			break;
		case 1:
			_frame = 1; // Clockhands
			break;
		case 2:
			_frame = 2;
			break;
		case 4:
			_frame = 3;
			break;
		case 8:
			_frame = 4;
			break;
		case 16:
			_frame = 5;
			break;
		case 32:
			_frame = 6;
			break;
		case 18:
			_frame = 7; // Lines
			break;
		case 36:
			_frame = 8;
			break;
		case 9:
			_frame = 9;
			break;
		case 3:
			_frame = 10; // Clusters
			break;
		case 6:
			_frame = 11;
			break;
		case 12:
			_frame = 12;
			break;
		case 24:
			_frame = 13;
			break;
		case 48:
			_frame = 14;
			break;
		case 33:
			_frame = 15;
			break;
		case 5:
			_frame = 16; // U
			break;
		case 10:
			_frame = 17;
			break;
		case 20:
			_frame = 18;
			break;
		case 40:
			_frame = 19;
			break;
		case 17:
			_frame = 20;
			break;
		case 34:
			_frame = 21;
			break;
		case 21:
			_frame = 22; // Triangles
			break;
		case 42:
			_frame = 23;
			break;
		case 26:
			_frame = 24; // Wiggler A
			break;
		case 52:
			_frame = 25;
			break;
		case 41:
			_frame = 26;
			break;
		case 19:
			_frame = 27;
			break;
		case 38:
			_frame = 28;
			break;
		case 13:
			_frame = 29;
			break;
		case 50:
			_frame = 30; // Wiggler B
			break;
		case 37:
			_frame = 31;
			break;
		case 11:
			_frame = 32;
			break;
		case 22:
			_frame = 33;
			break;
		case 44:
			_frame = 34;
			break;
		case 25:
			_frame = 35;
			break;
		case 35:
			_frame = 36; // Shield
			break;
		case 7:
			_frame = 37;
			break;
		case 14:
			_frame = 38;
			break;
		case 28:
			_frame = 39;
			break;
		case 56:
			_frame = 40;
			break;
		case 49:
			_frame = 41;
			break;
		case 43:
			_frame = 42; // Galor
			break;
		case 23:
			_frame = 43;
			break;
		case 46:
			_frame = 44;
			break;
		case 29:
			_frame = 45;
			break;
		case 58:
			_frame = 46;
			break;
		case 53:
			_frame = 47;
			break;
		case 27:
			_frame = 48; // Bones
			break;
		case 54:
			_frame = 49;
			break;
		case 45:
			_frame = 50;
			break;
		case 39:
			_frame = 51; // Shield
			break;
		case 15:
			_frame = 52;
			break;
		case 30:
			_frame = 53;
			break;
		case 60:
			_frame = 54;
			break;
		case 57:
			_frame = 55;
			break;
		case 51:
			_frame = 56;
			break;
		case 47:
			_frame = 57; // Chip
			break;
		case 31:
			_frame = 58;
			break;
		case 62:
			_frame = 59;
			break;
		case 61:
			_frame = 60;
			break;
		case 59:
			_frame = 61;
			break;
		case 55:
			_frame = 62;
			break;
		case 63:
			_frame = 63; // All
			break;
		default:
			_frame = 0; // None
			show_debug_message($"[WARNING] Bad bitmask! {_bitmask}");
			break;
	}
	return _frame;
}