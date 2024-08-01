if (growth_counter >= growth_counter_max){
	var _size = array_length(tip_arr);
	for (var _i = 0; _i < _size; _i++){
		ds_queue_enqueue(growth_queue, tip_arr[_i]);
	}
	var _tip;
	while (!ds_queue_empty(growth_queue)){
		for (var _i = 0; _i < _size; _i++){
			_tip = ds_queue_dequeue(growth_queue);
			_tip.grow(irandom(7));
		}
	}
	growth_counter = -1;
}
growth_counter++;