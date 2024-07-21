function __search_grid_class(_x, _y, _radius) constructor{
	// Argument Members
	x = _x;
	y = _y;
	radius = _radius;
	
	// Default Members
	x_start = x;
	y_start = y;
	neighbors = [];
	queue = ds_queue_create();
	grid = ds_grid_create(WORLDSIZE_W, WORLDSIZE_H);
	ds_grid_clear(grid, 0);
	
	// Static Members
	static clean = function(){
		ds_grid_destroy(grid);
		ds_queue_destroy(queue);
	}
	static search = function(){
		// Add this cell
		grid[# x, y] = 1;
	
		// Exclude the start position from the final array
		if (!(x == x_start && y == y_start)){
			array_push(neighbors, [x, y]);
		}
		if (x == 6 && y == 4){
			show_debug_message("");
		}
		if (radius == 0){
			return;
		}
		radius--;
		// Check neighbors
	
		// Even or Odd Rows
		// Right
		x++;
		if (x < WORLDSIZE_W){
			if (grid[# x, y] == 0){
				ds_queue_enqueue(queue, [x, y, radius]);
			}
		}
		x--;
	
		// Left
		x--;
		if (x >= 0){
			if (grid[# x, y] == 0){
				ds_queue_enqueue(queue, [x, y, radius]);
			}
		}
		x++;
	
		// Up Left / Up Right
		y--;
		if (y >= 0){
			if (grid[# x, y] == 0){
				ds_queue_enqueue(queue, [x, y, radius]);
			}
		}
		y++;
		// Down Left / Down Right
		y++;
		if (y < WORLDSIZE_H){
			if (grid[# x, y] == 0){
				ds_queue_enqueue(queue, [x, y, radius]);
			}
		}
		y--;
	
		// Even numbered rows
		if (is_even(y)){
			// Up Right
			x++;
			y--;
			if (x < WORLDSIZE_W && y >= 0){
				if (grid[# x, y] == 0){
					ds_queue_enqueue(queue, [x, y, radius]);
				}
			}
			x--;
			y++;
		
			// Down Right
			x++;
			y++;
			if (x < WORLDSIZE_W && y < WORLDSIZE_H){
				if (grid[# x, y] == 0){
					ds_queue_enqueue(queue, [x, y, radius]);
				}
			}
			x--;
			y--;
		}
	
		// Odd numbered rows
		else{
			// Up Left
			x--;
			y--;
			if (x >= 0 && y >= 0){
				if (grid[# x, y] == 0){
					ds_queue_enqueue(queue, [x, y, radius]);
				}
			}
			x++;
			y++;
		
			// Down Left
			x--;
			y++;
			if (x >= 0 && y < WORLDSIZE_H){
				if (grid[# x, y] == 0){
					ds_queue_enqueue(queue, [x, y, radius]);
				}
			}
			x++;
			y--;
		}
		while (!ds_queue_empty(queue)){
			var _cell = ds_queue_dequeue(queue);
			x = _cell[0];
			y = _cell[1];
			radius = _cell[2];
			search();
		}
	}
	//
}