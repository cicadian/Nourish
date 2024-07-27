function actors_draw(){
	with (oActor_){
		ds_queue_enqueue(other.actor_render_queue, id);
	}
	while (!ds_queue_empty(actor_render_queue)){
		actor_draw(ds_queue_dequeue(actor_render_queue));
	}
	if (DEV_DRAW_COLLISION){
		dev_draw_collision();
	}
}

function actors_step(){
	with (oActor_){
		ds_queue_enqueue(other.actor_step_queue, id);
	}
	while (!ds_queue_empty(actor_step_queue)){
		actor_step(ds_queue_dequeue(actor_step_queue));
	}
	cam_x = oActor_Player.x - NATIVE_W / 2;
	cam_y = oActor_Player.y - NATIVE_H / 2;
	cam_x = clamp(cam_x, 0, (WORLDSIZE_W * CELLSIZE_W) - NATIVE_W - 1);
	cam_y = clamp(cam_y, 0, (WORLDSIZE_H * CELLSIZE_H) - NATIVE_H - 1);
}

function game_declare_methods(){
	/// @func dev_draw_grid_coordinates
	dev_draw_grid_coordinates = function(){
		for (var _w = 0; _w < WORLDSIZE_W; _w++){
			for (var _h = 0; _h < WORLDSIZE_H; _h++){
				draw_text_color(_w * CELLSIZE_W + 1, _h * CELLSIZE_H + 6, $"{_w}", c_maroon, c_maroon, c_maroon, c_maroon, 1);
				draw_text_color(_w * CELLSIZE_W + 8, _h * CELLSIZE_H + 8, $"{_w}", c_dkgray, c_dkgray, c_dkgray, c_dkgray, 1);
			}
		}
	}
	/// @func dev_draw_grid_value
	dev_draw_grid_value = function(){
		for (var _w = 0; _w < WORLDSIZE_W; _w++){
			for (var _h = 0; _h < WORLDSIZE_H; _h++){
				draw_text_color(_w * CELLSIZE_W + 1, _h * CELLSIZE_H + 8, $"{wall_grid[# _w, _h]}", c_black, c_black, c_black, c_black, 1);
			}
		}
	}
	/// @func dev_draw_collision
	dev_draw_collision = function(){
		draw_set_color(c_blue);
		draw_set_alpha(0.65);
		with (oActor_){
			draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, false);
		}
		draw_set_color(c_white);
		draw_set_alpha(1);
	}
}
dev_draw_grid_value();
