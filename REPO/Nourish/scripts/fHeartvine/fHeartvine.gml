function heartvine_create(_grid_x, _grid_y){
	instance_create_layer(_grid_x * CELLSIZE, _grid_y * CELLSIZE, global.layer_actor, oBlock_Heartvine);
	light_add(_grid_x, _grid_y, __LIGHT_LEVEL.BRIGHT + 1, LIGHT_MAX_VALUE);
}

function __arm_class(_x, _y, _dir8, _parent) constructor{
	x = _x;
	y = _y;
	frame = _dir8;
	frame_grow = _dir8;
	parent = _parent;
	HEARTVINE.grid[# x, y] = self;
	array_push(HEARTVINE.vine_arr, self);
	array_push(HEARTVINE.tip_arr, self);
	GAME.refresh_actor_surf = true;
	static grow = function(_dir8){
		// Ignore sharp turns
		if (abs(frame - _dir8) > 2){
			return undefined;
		}
		var _next_x = x;
		var _next_y = y;
		switch(_dir8){
			case __DIR8.EAST:
				_next_x++;
				break;
			case __DIR8.NORTHEAST:
				_next_x++;
				_next_y--;
				break;
			case __DIR8.NORTH:
				_next_y--;
				break;
			case __DIR8.NORTHWEST:
				_next_x--;
				_next_y--;
				break;
			case __DIR8.WEST:
				_next_x--;
				break;
			case __DIR8.SOUTHWEST:
				_next_x--;
				_next_y++;
				break;
			case __DIR8.SOUTH:
				_next_y++;
				break;
			case __DIR8.SOUTHEAST:
				_next_x++;
				_next_y++;
				break;
		}
		if (!point_in_rectangle(_next_x, _next_y, 0, 0, WORLDSIZE_W - 1, WORLDSIZE_H - 1)){
			return undefined;
		}
		if (HEARTVINE.grid[# _next_x, _next_y] != undefined){
			return undefined;
		}
		// Prevent crossovers
		if (_dir8 mod 2 == 1){
			if (HEARTVINE.grid[# _next_x, y] != undefined && HEARTVINE.grid[# x, _next_y] != undefined){
				return undefined;
			}
		}
		frame_grow = (_dir8 + 4) mod 8;
		var _index = array_get_index(HEARTVINE.tip_arr, self);
		array_delete(HEARTVINE.tip_arr, _index, 1);
		var _arm_inst = new __arm_class(_next_x, _next_y, _dir8, self);
		return _arm_inst;
	}
}

function heartvine_declare_methods(){
	arm_create = function(_x, _y, _dir8, _parent){
		var _arm_inst = new __arm_class(_x, _y, _dir8, _parent);
		return _arm_inst;
	}
}