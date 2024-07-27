function __search_grid_class(_x, _y, _radius, _diagonal) constructor{
	// Argument Members
	x = _x;
	y = _y;
	radius = _radius;
	diagonal = _diagonal;
	
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
	
		// Right
		x++;
		if (x < WORLDSIZE_W){
			if (grid[# x, y] == 0){
				ds_queue_enqueue(queue, [x, y, radius]);
			}
		}
		x--;
	
		// Up
		y--;
		if (y >= 0){
			if (grid[# x, y] == 0){
				ds_queue_enqueue(queue, [x, y, radius]);
			}
		}
		y++;
	
		// Left
		x--;
		if (x >= 0){
			if (grid[# x, y] == 0){
				ds_queue_enqueue(queue, [x, y, radius]);
			}
		}
		x++;
		
		// Down
		y++;
		if (y < WORLDSIZE_H){
			if (grid[# x, y] == 0){
				ds_queue_enqueue(queue, [x, y, radius]);
			}
		}
		y--;
		if (diagonal){
			// Up Right
			x++;
			y--;
			if (x < WORLDSIZE_W){
				if (y >= 0){
					ds_queue_enqueue(queue, [x, y, radius, diagonal]);
				}
			}
			y++;
			x--;
			// Up Left
			x--;
			y--;
			if (x >= 0){
				if (y >= 0){
					ds_queue_enqueue(queue, [x, y, radius, diagonal]);
				}
			}
			x++;
			y++;
			// Down Left
			x--;
			y++;
			if (x >= 0){
				if (y < WORLDSIZE_H){
					ds_queue_enqueue(queue, [x, y, radius, diagonal]);
				}
			}
			x++;
			y--;
			// Down Right
			x++;
			y++;
			if (x < WORLDSIZE_W){
				if (y < WORLDSIZE_H){
					ds_queue_enqueue(queue, [x, y, radius, diagonal]);
				}
			}
			x--;
			y--;
		}
	}
}