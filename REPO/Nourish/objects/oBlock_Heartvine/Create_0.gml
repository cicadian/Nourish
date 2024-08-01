#macro HEARTVINE oBlock_Heartvine.id

heartvine_declare_methods();

grid_x = x div CELLSIZE;
grid_y = y div CELLSIZE;

grid = ds_grid_create(WORLDSIZE_W, WORLDSIZE_H);
ds_grid_clear(grid, undefined);
grid[# grid_x, grid_y] = id;

root_arr = [];
vine_arr = [];
tip_arr = [];
growth_queue = ds_queue_create();

array_push(root_arr, arm_create(grid_x + 1, grid_y, __DIR8.EAST,  id));
array_push(root_arr, arm_create(grid_x, grid_y - 1, __DIR8.NORTH, id));
array_push(root_arr, arm_create(grid_x - 1, grid_y, __DIR8.WEST,  id));
array_push(root_arr, arm_create(grid_x, grid_y + 1, __DIR8.SOUTH, id));

growth_counter = 0;
growth_counter_max = 30;