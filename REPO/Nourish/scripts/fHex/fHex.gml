function get_bitmask(_x, _y){
	var _right = true;
	var _up    = true;
	var _left  = true;
	var _down  = true;
	if (_x + 1 < WORLDSIZE_W){
		_right = GAME.wall_grid[# _x + 1, _y];
	}
	if (_x - 1 >= 0){
		_left = GAME.wall_grid[# _x - 1, _y];
	}
	if (_y + 1 < WORLDSIZE_H){
		_up = GAME.wall_grid[# _x, _y - 1];
	}
	if (_y - 1 >= 0){
		_down = GAME.wall_grid[# _x, _y + 1];
	}
	var _bitmask = 0;
	_bitmask += _right;
	_bitmask += _right && _up   * 2;
	_bitmask += _up             * 4;
	_bitmask += _left && _up    * 8;
	_bitmask += _left           * 16;
	_bitmask += _left && _down  * 32;
	_bitmask += _down           * 64;
	_bitmask += _right && _down * 128;
	return _bitmask;
}

function lookup_bitmask(_bitmask){
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
		default:
			_frame = 0; // None
			show_debug_message($"[WARNING] Bad bitmask! {_bitmask}");
			break;
	}
	return _frame;
}