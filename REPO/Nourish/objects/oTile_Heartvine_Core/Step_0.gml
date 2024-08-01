if (growth_counter >= growth_counter_max){
	for (var _i = 0; _i < 4; _i++){
		if (irandom(4) == 0){
			continue;
		}
		arms_arr[_i].grow(irandom(7));
	}
	growth_counter = -1;
}
growth_counter++;