event_inherited();

heartvine_declare_methods();

grid_x = x div CELLSIZE;
grid_y = y div CELLSIZE;

grid = ds_grid_create(WORLDSIZE_W, WORLDSIZE_H);
ds_grid_clear(grid, undefined);
grid[# grid_x, grid_y] = id;

arms_arr = [];
frames_arr = [];

array_push(arms_arr, arm_create(grid_x, grid_y, __DIR8.EAST,  id));
array_push(arms_arr, arm_create(grid_x, grid_y, __DIR8.NORTH, id));
array_push(arms_arr, arm_create(grid_x, grid_y, __DIR8.WEST,  id));
array_push(arms_arr, arm_create(grid_x, grid_y, __DIR8.SOUTH, id));

growth_counter = 0;
growth_counter_max = 120;