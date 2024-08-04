#macro INFOBOX_X 260
#macro INFOBOX_Y 120
#macro INFOBOX_W 60
#macro INFOBOX_H 60

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
function blocks_draw(){
	with (oBlock_){
		ds_queue_enqueue(other.block_render_queue, id);
	}
	while (!ds_queue_empty(block_render_queue)){
		block_draw(ds_queue_dequeue(block_render_queue));
	}
}

function actors_step(){
	with (oActor_){
		ds_queue_enqueue(other.actor_step_queue, id);
	}
	while (!ds_queue_empty(actor_step_queue)){
		actor_step(ds_queue_dequeue(actor_step_queue));
	}
	
	if (input_check("accept")){
		hotbar.use();
	}
	
	cam_x = oActor_Player.x - NATIVE_W / 2;
	cam_y = oActor_Player.y - NATIVE_H / 2;
	cam_x = clamp(cam_x, 0, (WORLDSIZE_W * CELLSIZE) - NATIVE_W);
	cam_y = clamp(cam_y, 0, (WORLDSIZE_H * CELLSIZE) - NATIVE_H);
}

function game_declare_methods(){
	/// @func dev_draw_grid_coordinates
	dev_draw_grid_coordinates = function(){
		for (var _w = 0; _w < WORLDSIZE_W; _w++){
			for (var _h = 0; _h < WORLDSIZE_H; _h++){
				draw_text_color(_w * CELLSIZE + 1, _h * CELLSIZE + 3, $"{_w}", c_maroon, c_maroon, c_maroon, c_maroon, 1);
				draw_text_color(_w * CELLSIZE + 8, _h * CELLSIZE + 5, $"{_h}", c_dkgray, c_dkgray, c_dkgray, c_dkgray, 1);
			}
		}
	}
	/// @func dev_draw_grid_value
	dev_draw_grid_value = function(){
		var _value;
		for (var _w = 0; _w < WORLDSIZE_W; _w++){
			for (var _h = 0; _h < WORLDSIZE_H; _h++){
				_value = GAME.light_grid[# _w, _h];
				draw_text_color(_w * CELLSIZE + 1, _h * CELLSIZE + 8, $"{_value}", c_black, c_black, c_black, c_black, 1);
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
	
	/// @func infobox_draw
	infobox_draw = function(){
		draw_set_color(c_black);
		draw_set_alpha(0.65);
		draw_rectangle(INFOBOX_X - 1, INFOBOX_Y - 1, INFOBOX_X + INFOBOX_W - 2, INFOBOX_Y + INFOBOX_H - 2, false);
		draw_set_color(c_white);
		draw_set_alpha(1);
		draw_rectangle(INFOBOX_X - 1, INFOBOX_Y - 1, INFOBOX_X + INFOBOX_W - 2, INFOBOX_Y + INFOBOX_H - 2, true);
		draw_sprite(inspect_data.sprite, inspect_data.frame, INFOBOX_X, INFOBOX_Y);
		draw_text(INFOBOX_X, INFOBOX_Y + 16, $"WATER {inspect_data.saturation}");
		draw_text(INFOBOX_X, INFOBOX_Y + 32, $"FOOD  {inspect_data.nutrition}");
		draw_text(INFOBOX_X, INFOBOX_Y + 48, $"DEPTH {inspect_data.water_level}");
	}
}