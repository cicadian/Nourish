function actors_draw(){
	with (oActor_){
		ds_queue_enqueue(other.actor_render_queue, id);
	}
	while (!ds_queue_empty(actor_render_queue)){
		actor_draw(ds_queue_dequeue(actor_render_queue));
	}
}

function actors_step(){
	with (oActor_){
		ds_queue_enqueue(other.actor_step_queue, id);
	}
	while (!ds_queue_empty(actor_step_queue)){
		actor_step(ds_queue_dequeue(actor_step_queue));
	}
}

function game_declare_methods(){
	dev_draw_grid_coordinates = function(){
		for (var _w = 0; _w < WORLDSIZE_W; _w++){
			for (var _h = 0; _h < WORLDSIZE_H; _h++){
				if (_h mod 2 == 0){
					_x_offset = CELLSIZE_W / 2;
				}
				else{
					_x_offset = 0;
				}
				draw_text_color(_w * CELLSIZE_W + _x_offset + 1, _h * CELLSIZE_H + 6, $"{_w}", c_maroon, c_maroon, c_maroon, c_maroon, 1);
				draw_text_color(_w * CELLSIZE_W + _x_offset + 8, _h * CELLSIZE_H + 8, $"{_w}", c_dkgray, c_dkgray, c_dkgray, c_dkgray, 1);
			}
		}
	}
}