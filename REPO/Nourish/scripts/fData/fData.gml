
function __search_grid_class(_x, _y, _radius, _diagonal, _search_grid, _skip_value) constructor{
	// Argument Members
	x = _x;
	y = _y;
	radius = _radius;
	diagonal = _diagonal;
	search_grid = _search_grid;
	skip_value = _skip_value;
	
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
		if (radius == 0){
			return;
		}
		radius--;
		// Check neighbors
	
		// Right
		x++;
		if (x < WORLDSIZE_W){
			if (grid[# x, y] == 0){
				if (search_grid[# x, y] != skip_value){
					ds_queue_enqueue(queue, [x, y, radius, diagonal, search_grid, skip_value]);
				}
			}
		}
		x--;
	
		// Up
		y--;
		if (y >= 0){
			if (grid[# x, y] == 0){
				if (search_grid[# x, y] != skip_value){
					ds_queue_enqueue(queue, [x, y, radius, diagonal, search_grid, skip_value]);
				}
			}
		}
		y++;
	
		// Left
		x--;
		if (x >= 0){
			if (grid[# x, y] == 0){
				if (search_grid[# x, y] != skip_value){
					ds_queue_enqueue(queue, [x, y, radius, diagonal, search_grid, skip_value]);
				}
			}
		}
		x++;
		
		// Down
		y++;
		if (y < WORLDSIZE_H){
			if (grid[# x, y] == 0){
				if (search_grid[# x, y] != skip_value){
					ds_queue_enqueue(queue, [x, y, radius, diagonal, search_grid, skip_value]);
				}
			}
		}
		y--;
		if (diagonal){
			// Up Right
			x++;
			y--;
			if (x < WORLDSIZE_W){
				if (y >= 0){
					if (search_grid[# x, y] != skip_value){
						ds_queue_enqueue(queue, [x, y, radius, diagonal, search_grid, skip_value]);
					}
				}
			}
			y++;
			x--;
			// Up Left
			x--;
			y--;
			if (x >= 0){
				if (y >= 0){
					if (search_grid[# x, y] != skip_value){
						ds_queue_enqueue(queue, [x, y, radius, diagonal, search_grid, skip_value]);
					}
				}
			}
			x++;
			y++;
			// Down Left
			x--;
			y++;
			if (x >= 0){
				if (y < WORLDSIZE_H){
					if (search_grid[# x, y] != skip_value){
						ds_queue_enqueue(queue, [x, y, radius, diagonal, search_grid, skip_value]);
					}
				}
			}
			x++;
			y--;
			// Down Right
			x++;
			y++;
			if (x < WORLDSIZE_W){
				if (y < WORLDSIZE_H){
					if (search_grid[# x, y] != skip_value){
						ds_queue_enqueue(queue, [x, y, radius, diagonal, search_grid, skip_value]);
					}
				}
			}
			x--;
			y--;
		}
		while (!ds_queue_empty(queue)){
			var _cell = ds_queue_dequeue(queue);
			x        = _cell[0];
			y        = _cell[1];
			radius   = _cell[2];
			diagonal = _cell[3];
			search();
		}
	}
}