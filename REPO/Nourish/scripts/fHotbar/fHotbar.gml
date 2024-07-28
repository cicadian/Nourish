#macro INVENTORY_SIZE_MAX 4
#macro HOTBAR_NUM_ACTIONS 4
#macro HOTBAR_X 24
#macro HOTBAR_Y NATIVE_H * global.window_scale - 24
#macro HOTBAR_SLOT_SIZE 20
enum __HOTBAR_SLOTS{
	DIG,
	ACTIVATE,
	ATTACK,
	TAMP
}

function __hotbar_class() constructor{
	slots  = [];   // Array of function pointer hotbar slots
	active = true; // If the hotbar is active
	show   = true; // If the hotbar should be drawn
	choice = 0;    // Current hotbar slot
	array_push(slots, __action_dig);
	array_push(slots, __action_activate);
	array_push(slots, __action_attack);
	array_push(slots, __action_tamp);
	static draw = function(){
		for (var _i = 0; _i < HOTBAR_NUM_ACTIONS; _i++){
			draw_sprite_ext(sGUI_Hotbar_Square, 0, (HOTBAR_X + _i * HOTBAR_SLOT_SIZE) * global.window_scale, HOTBAR_Y * global.window_scale, global.window_scale, global.window_scale, 0, c_white, 1);
			draw_sprite_ext(sGUI_Hotbar_Actions, _i, (HOTBAR_X + _i * HOTBAR_SLOT_SIZE) * global.window_scale, HOTBAR_Y * global.window_scale, global.window_scale, global.window_scale, 0, c_white, 1);
		}
		draw_sprite_ext(sGUI_Hotbar_Selector, 0, (HOTBAR_X + choice * HOTBAR_SLOT_SIZE) * global.window_scale, HOTBAR_Y * global.window_scale, global.window_scale, global.window_scale, 0, c_white, 1);
	}
	static previous = function(){
		choice++;
		if (choice >= HOTBAR_NUM_ACTIONS){
			choice = 0;
		}
	}
	static next = function(){
		choice--;
		if (choice < 0){
			choice = HOTBAR_NUM_ACTIONS - 1;
		}
	}
	static use = function(){
		var _arguments = [];
		switch(choice){
			case __HOTBAR_SLOTS.DIG:
				_arguments[0] = oActor_Player;
				break;
			case __HOTBAR_SLOTS.ACTIVATE:
				_arguments[0] = oActor_Player;
				_arguments[1] = oActor_Player.target_id;
				break;
			case __HOTBAR_SLOTS.ATTACK:
				_arguments[0] = oActor_Player;
				_arguments[1] = oActor_Player.target_id;
				break;
			case __HOTBAR_SLOTS.TAMP:
				_arguments[0] = oActor_Player;
				break;
		}
		method_call(slots[choice], _arguments);
	}
}

function __action_dig(_digger_id){
	// Perform a digging action on a given grid cell
	if (point_in_rectangle(_digger_id.point_x, _digger_id.point_y, 0, 0, WORLDSIZE_W - 1, WORLDSIZE_H - 1)){
		wall_dig(_digger_id.point_x, _digger_id.point_y);
	}
}

function __action_activate(_actor_id, _activator_id){
	// Perform a grab or place or use action between two instances
	if (!instance_exists(_activator_id)){
		if (_actor_id.inventory_count > 0){
			// Place an object
		}
	}
	else{
		if (_activator_id.type == "item"){
			if (_actor_id.inventory_count < INVENTORY_SIZE_MAX){
				// Grab an item
			}
		}
		else{
			// Use _activator_id
		}
	}
}

function __action_attack(_attacker_id, _defender_id){
	if (instance_exists(_defender_id)){
		// Attack
	}
}

function __action_tamp(_tamper_id){
	// Tamp cell
}