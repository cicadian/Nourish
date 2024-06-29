function actors_draw(){
	with (oActor_){
		ds_queue_enqueue(other.actor_render_queue, id);
	}
	while (!ds_queue_empty(actor_render_queue)){
		actor_draw(ds_queue_dequeue(actor_render_queue));
	}
}

function actor_draw(_id){
	draw_sprite_ext(_id.sprite_index, _id.image_index, 
					_id.x,            _id.y, 
					_id.image_xscale, _id.image_yscale, 
					_id.image_angle,  _id.image_blend, 
					_id.image_alpha);
}