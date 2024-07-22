function actor_move(){
	
}

function actor_step(_id){
	with (_id){
		if (global.use_gamepad){
			vec_x = gamepad_axis_value(global.gamepad_array[0], 0);
			vec_y = gamepad_axis_value(global.gamepad_array[0], 1);
		}
		else{
			vec_x = 0;
			vec_y = 0;
		}
		if (abs(vec_x) < 0.1 || abs(vec_y) < 0.1){
			if (abs(vec_x) < 0.1){ 
				vec_x = 0;
			}
			if (abs(vec_y) < 0.1){
				vec_y = 0;
			}
		}
		if (vec_x == 0 && vec_y == 0){
			var _dir   = 0;
			var _left  = input_check("left");
			var _right = input_check("right");
			var _up    = input_check("up");
			var _down  = input_check("down");
			if (_right && !_left){
				if (_up && !_down){
					_dir = 60;
				}
				else if (!_up && _down){
					_dir = 300;
				}
				else if (!_up && !_down){
					_dir = 0;
				}
			}
			else if (_left && !_right){
				if (_up && !_down){
					_dir = 120;
				}
				else if (!_up && _down){
					_dir = 240;
				}
				else if (!_up && !_down){
					_dir = 180;
				}
			}
			else if (!_left && !_right){
				if (_up && !_down){
					_dir = 90;
				}
				else if (!_up && _down){
					_dir = 270;
				}
			}
			if (_right || _left || _up || _down){
				vec_x = lengthdir_x(1, _dir);
				vec_y = lengthdir_y(1, _dir);
			}
		}
		
		var _old_x = x;
		var _old_y = y;
		
		if (rectangle_in_rectangle(bbox_left + vec_x, bbox_top + vec_y,
									bbox_right + vec_x, bbox_bottom + vec_y,
									0, 0, WORLDSIZE_W * CELLSIZE_W,
									WORLDSIZE_H * CELLSIZE_H)){
			x += vec_x;
			y += vec_y;
			var _x_offset = 0;
			if (is_even(y div CELLSIZE_H)){
				_x_offset = CELLSIZE_W / 2;
			}
			grid_x = (x - _x_offset) div CELLSIZE_W;
			grid_y = y div CELLSIZE_H;
		}
		
		if (x != _old_x || y != _old_y){
			GAME.refresh_actor_surf = true;
		}
		
		if (abs(vec_x) > 0 || abs(vec_y) > 0){
			dir = point_direction(0, 0, vec_x, vec_y);
		}
	}
}

function actor_draw(_id){
	draw_sprite_ext(_id.sprite_index, _id.image_index ,
					_id.x           , _id.y           ,
					_id.image_xscale, _id.image_yscale,
					_id.image_angle , _id.image_blend ,
					_id.image_alpha );
	draw_sprite_ext(sActor_Arrow    ,  0              ,
					_id.x           , _id.y           ,
					_id.image_xscale, _id.image_yscale,
					_id.dir         , c_white         ,
					1               );
	var _x_offset = 0;
	if (is_even(_id.grid_y)){
		_x_offset = CELLSIZE_W / 2;
	}
	draw_sprite_ext(sHex_White, 0, 
	_id.grid_x * CELLSIZE_W + _x_offset, 
	_id.grid_y * CELLSIZE_H, 
	1, 1, 0, c_white, 0.65);
}