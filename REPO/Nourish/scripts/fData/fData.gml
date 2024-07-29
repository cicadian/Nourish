
function __search_grid_class(_x, _y, _radius, _diagonal, _search_grid, _skip_value, _operator) constructor{
	// Argument Members
	x = _x;
	y = _y;
	radius = _radius;
	diagonal = _diagonal;
	search_grid = _search_grid;
	skip_value = _skip_value;
	operator = _operator;
	
	// Default Members
	x_start = x;
	y_start = y;
	neighbors = [];
	edges = [];
	queue = ds_queue_create();
	grid = ds_grid_create(WORLDSIZE_W, WORLDSIZE_H);
	skip = false;
	ds_grid_clear(grid, undefined);
	//ds_grid_clear(grid, [0, 0]);
	for (var _w = 0; _w < WORLDSIZE_W; _w++){
		for (var _h = 0; _h < WORLDSIZE_H; _h++){
			grid[# _w, _h] = {searched : false, search_radius : 0};
		}
	}
	
	// Static Members
	static clean = function(){
		ds_grid_destroy(grid);
		ds_queue_destroy(queue);
	}
	static search = function(){
		grid[# x, y].search_radius = radius;
		if (skip){
			array_push(edges, [x, y]);
			return;
		}
		// Exclude the start position from the final array
		if (!(x == x_start && y == y_start)){
			array_push(neighbors, [x, y]);
		}
		if (radius == 0){
			return;
		}
		radius--;
		// Check neighbors
		var _skip = true;
		// Right
		x++;
		if (x < WORLDSIZE_W){
			if (grid[# x, y].searched == 0){
				if (!comparison(search_grid[# x, y], skip_value, operator)){
					_skip = false;
				}
				ds_queue_enqueue(queue, [x, y, radius, _skip]);
				grid[# x, y].searched = true;
			}
		}
		x--;
	
		// Up
		y--;
		if (y >= 0){
			if (grid[# x, y].searched == 0){
				if (!comparison(search_grid[# x, y], skip_value, operator)){
					_skip = false;
				}
				ds_queue_enqueue(queue, [x, y, radius, _skip]);
				grid[# x, y].searched = true;
			}
		}
		y++;
	
		// Left
		x--;
		if (x >= 0){
			if (grid[# x, y].searched == 0){
				if (!comparison(search_grid[# x, y], skip_value, operator)){
					_skip = false;
				}
				ds_queue_enqueue(queue, [x, y, radius, _skip]);
				grid[# x, y].searched = true;
			}
		}
		x++;
		
		// Down
		y++;
		if (y < WORLDSIZE_H){
			if (grid[# x, y].searched == 0){
				if (!comparison(search_grid[# x, y], skip_value, operator)){
					_skip = false;
				}
				ds_queue_enqueue(queue, [x, y, radius, _skip]);
				grid[# x, y].searched = true;
			}
		}
		y--;
		if (diagonal){
			// Up Right
			x++;
			y--;
			if (x < WORLDSIZE_W){
				if (y >= 0){
					if (grid[# x, y].searched == 0){
						if (!comparison(search_grid[# x, y], skip_value, operator)){
							_skip = false;
						}
						ds_queue_enqueue(queue, [x, y, radius, _skip]);
						grid[# x, y].searched = true;
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
					if (grid[# x, y].searched == 0){
						if (!comparison(search_grid[# x, y], skip_value, operator)){
							_skip = false;
						}
						ds_queue_enqueue(queue, [x, y, radius, _skip]);
						grid[# x, y].searched = true;
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
					if (grid[# x, y].searched == 0){
						if (!comparison(search_grid[# x, y], skip_value, operator)){
							_skip = false;
						}
						ds_queue_enqueue(queue, [x, y, radius, _skip]);
						grid[# x, y].searched = true;
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
					if (grid[# x, y].searched == 0){
						if (!comparison(search_grid[# x, y], skip_value, operator)){
							_skip = false;
						}
						ds_queue_enqueue(queue, [x, y, radius, _skip]);
						grid[# x, y].searched = true;
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
			skip     = _cell[3];
			search();
		}
	}
}