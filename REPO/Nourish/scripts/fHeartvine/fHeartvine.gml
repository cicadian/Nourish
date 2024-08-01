function heartvine_create(_grid_x, _grid_y){
	instance_create_layer(_grid_x * CELLSIZE, _grid_y * CELLSIZE, global.layer_actor, oActor_Heartvine);
	light_add(_grid_x, _grid_y, __LIGHT_LEVEL.BRIGHT + 1, LIGHT_MAX_VALUE);
}

function __arm_class(_x, _y, _dir8, _parent) constructor{
	x = _x;
	y = _y;
	frame_arr = [_dir8];
	parent = _parent;
	// Each connection needs to render an additional frame
	children_arr = [];
	oActor_Heartvine.grid[# x, y] = self;
	
	array_push(frame_arr, _dir8);
	array_push(oActor_Heartvine.frames_arr, [x, y, _dir8]);
	
	static grow = function(_dir8){
		var _next_x = x;
		var _next_y = y;
		switch(_dir8){
			case __DIR8.EAST:
				_next_x = x + 1;
				break;
			case __DIR8.NORTHEAST:
				_next_x = x + 1;
				_next_y = y - 1;
				break;
			case __DIR8.NORTH:
				_next_y = y - 1;
				break;
			case __DIR8.NORTHWEST:
				_next_x = x - 1;
				_next_y = y - 1;
				break;
			case __DIR8.WEST:
				_next_x = x - 1;
				break;
			case __DIR8.SOUTHWEST:
				_next_x = x - 1;
				_next_y = y + 1;
				break;
			case __DIR8.SOUTH:
				_next_y = y + 1;
				break;
			case __DIR8.SOUTHEAST:
				_next_x = x + 1;
				_next_y = y + 1;
				break;
		}
		if (oActor_Heartvine.grid[# _next_x, _next_y] != undefined){
			return;
		}
		array_push(children_arr, new __arm_class(_next_x, _next_y, _dir8, self));
		array_push(frame_arr, (_dir8 + 4) mod 8);
		array_push(oActor_Heartvine.frames_arr, [x, y, (_dir8 + 4) mod 8]);
		light_add(_next_x, _next_y, __LIGHT_LEVEL.BRIGHT, LIGHT_MAX_VALUE);
	}
	static previous = function(_parent){
		return parent;
	}
	static next = function(_child_num){
		return children_arr[_child_num];
	}
	static first = function(_parent){
		var _previous = parent;
		while (_previous != undefined){
			_previous = previous();
		}
		return _previous.parent;
	}
	static last = function(_child){
		var _last_arr = [];
		while (array_length(children_arr) == 1){
			next(0);
		}
		while(array_length(children_arr) > 1){
			_children_size = array_length(children_arr);
			for (var _i = 0; _i < _children_size; _i++){
				children_array.next([_i]);
			}
		}
		while(array_length(children_arr) == 0){
			array_push(_last_arr, self);
			return;
		}
	}
}

function heartvine_declare_methods(){
	arm_create = function(_x, _y, _dir8, _parent){
		var _arm_inst = new __arm_class(_x, _y, _dir8, _parent);
		return _arm_inst;
	}
}