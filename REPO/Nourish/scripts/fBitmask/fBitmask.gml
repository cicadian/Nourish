function get_bitmask(_x, _y){
	var _right      = true;
	var _right_up   = true;
	var _up         = true;
	var _left_up    = true;
	var _left       = true;
	var _left_down  = true;
	var _down       = true;
	var _right_down = true;
	
	var _in_bounds_right = _x + 1 < WORLDSIZE_W;
	var _in_bounds_up    = _y - 1 >= 0;
	var _in_bounds_left  = _x - 1 >= 0;
	var _in_bounds_down  = _y + 1 < WORLDSIZE_H;
	if (_in_bounds_right){
		_right          = GAME.wall_grid[# _x + 1, _y    ] > -1;
		if (_in_bounds_up){
			_right_up   = GAME.wall_grid[# _x + 1, _y - 1] > -1;
		}
		if (_in_bounds_down){
			_right_down = GAME.wall_grid[# _x + 1, _y + 1] > -1;
		}
	}
	if (_in_bounds_up){
		_up             = GAME.wall_grid[# _x    , _y - 1] > -1;
	}
	if (_in_bounds_left){
		_left           = GAME.wall_grid[# _x - 1, _y    ] > -1;
		if (_in_bounds_up){
			_left_up    = GAME.wall_grid[# _x - 1, _y - 1] > -1;
		}
		if (_in_bounds_down){
			_left_down  = GAME.wall_grid[# _x - 1, _y + 1] > -1;
		}
	}
	if (_in_bounds_down){
		_down           = GAME.wall_grid[# _x    , _y + 1] > -1;
	}
	
	var _bitmask = 0;
	_bitmask += _right          * 1;
	if (_right && _up){
		_bitmask += _right_up   * 2;
	}
	_bitmask += _up             * 4;
	if (_left && _up){
		_bitmask += _left_up    * 8;
	}
	_bitmask += _left           * 16;
	if (_left && _down){
		_bitmask += _left_down  * 32;
	}
	_bitmask += _down           * 64;
	if (_right && _down){
		_bitmask += _right_down * 128;
	}
	return _bitmask;
}

function lookup_bitmask(_bitmask){
	var _frame;
	switch (_bitmask){
		case 0:
			_frame = 0; // Alone
			break;
		case 1:
			_frame = 1;
			break;
		case 4:
			_frame = 2;
			break;
		case 16:
			_frame = 3;
			break;
		case 64:
			_frame = 4;
			break;
		case 17:
			_frame = 5;
			break;
		case 68:
			_frame = 6;
			break;
		case 5:
			_frame = 7;
			break;
		case 20:
			_frame = 8;
			break;
		case 80:
			_frame = 9;
			break;
		case 65:
			_frame = 10;
			break;
		case 7:
			_frame = 11;
			break;
		case 28:
			_frame = 12;
			break;
		case 112:
			_frame = 13;
			break;
		case 193:
			_frame = 14;
			break;
		case 69:
			_frame = 15;
			break;
		case 21:
			_frame = 16;
			break;
		case 84:
			_frame = 17;
			break;
		case 81:
			_frame = 18;
			break;
		case 85:
			_frame = 19;
			break;
		case 23:
			_frame = 20;
			break;
		case 92:
			_frame = 21;
			break;
		case 113:
			_frame = 22;
			break;
		case 197:
			_frame = 23;
			break;
		case 209:
			_frame = 24;
			break;
		case 71:
			_frame = 25;
			break;
		case 29:
			_frame = 26;
			break;
		case 116:
			_frame = 27;
			break;
		case 199:
			_frame = 28;
			break;
		case 31:
			_frame = 29;
			break;
		case 124:
			_frame = 30;
			break;
		case 241:
			_frame = 31;
			break;
		case 87:
			_frame = 32;
			break;
		case 93:
			_frame = 33;
			break;
		case 117:
			_frame = 34;
			break;
		case 213:
			_frame = 35;
			break;
		case 215:
			_frame = 36;
			break;
		case 95:
			_frame = 37;
			break;
		case 125:
			_frame = 38;
			break;
		case 245:
			_frame = 39;
			break;
		case 119:
			_frame = 40;
			break;
		case 221:
			_frame = 41;
			break;
		case 223:
			_frame = 42;
			break;
		case 127:
			_frame = 43;
			break;
		case 253:
			_frame = 44;
			break;
		case 247:
			_frame = 45;
			break;
		case 255:
			_frame = 46;
			break;
		default:
			_frame = 0;
			show_debug_message($"[WARNING] Bad bitmask! {_bitmask}");
			break;
	}
	return _frame;
}