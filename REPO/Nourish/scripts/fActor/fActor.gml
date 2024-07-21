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
			vec_x = -input_check("left") + input_check("right");
			vec_y = -input_check("up")   + input_check("down");
		}
		
		x += vec_x;
		y += vec_y;
		
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
}