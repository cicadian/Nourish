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
			vec_x = -_left + _right;
			vec_y = -_up + _down;
			_dir = point_direction(0, 0, vec_x, vec_y);
			if (_right || _left || _up || _down){
				vec_x = lengthdir_x(1, _dir);
				vec_y = lengthdir_y(1, _dir);
			}
		}
		
		var _old_x = x;
		var _old_y = y;
		
		if (rectangle_in_rectangle(bbox_left + vec_x, bbox_top + vec_y,
									bbox_right + vec_x, bbox_bottom + vec_y,
									0, 0, WORLDSIZE_W * CELLSIZE,
									WORLDSIZE_H * CELLSIZE)){
			
			sub_x += vec_x * move_speed;
			sub_y += vec_y * move_speed;
			repeat(abs(sub_x)){
				if (!place_meeting(x + sign(vec_x), y, GAME)){
					x += sign(vec_x);
				}
				sub_x -= sign(vec_x);
			}
			repeat(abs(sub_y)){
				if (!place_meeting(x, y + sign(vec_y), GAME)){
					y += sign(vec_y);
				}
				sub_y -= sign(vec_y);
			}
			grid_x = x div CELLSIZE;
			grid_y = y div CELLSIZE;
		}
		if (x != _old_x || y != _old_y){
			GAME.refresh_actor_surf = true;
		}
		
		if (abs(vec_x) > 0 || abs(vec_y) > 0){
			dir = point_direction(0, 0, vec_x, vec_y);
		}
		
		if (vec_x != 0 || vec_y != 0){
			point_y = grid_y + sign(vec_y);
			point_x = grid_x + sign(vec_x);
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

	//draw_sprite_ext(sTile_White, 0, 
	//_id.grid_x * CELLSIZE, 
	//_id.grid_y * CELLSIZE, 
	//1, 1, 0, c_white, 0.65);
	//draw_sprite_ext(sTile_White, 0,
	//_id.point_x * CELLSIZE,
	//_id.point_y * CELLSIZE,
	//1, 1, 0, c_red, 0.75);
	//draw_text(_id.x, _id.y, _id.grid_x);
	//draw_text(_id.x, _id.y + 5, _id.grid_y);
	//draw_text(_id.x + 24, _id.y + 24, _id.point_x);
	//draw_text(_id.x + 24, _id.y + 30, _id.point_y);
}