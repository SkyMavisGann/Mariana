// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function addItem(itemName){
	array_push(global.inventory, itemName);
	audio_play_sound(sfx_pickup, 1, false);
	
	//Inventory Shenanigans
	var len = array_length(global.inventory);
	if (array_count(global.inventory, "Ice") - instance_number(obj_Ice_timer) > 0) {
		for (var i = 0; i < len; i++) {
			if (global.inventory[i] == "Ice") {
				with (instance_create_layer(0, 0, "player_layer", obj_Ice_timer)) {
					index = i;
				}
			} 
		}
	}

	if (array_contains(global.inventory, "Pocket Fish") &&
	(array_contains(global.inventory, "Mystery Key") ||
	array_contains(global.inventory, "Red Key") ||
	array_contains(global.inventory, "Yellow Key") ||
	array_contains(global.inventory, "Purple Key"))) {
		array_set(global.inventory, array_contains(global.inventory, "Pocket Fish"), "Holy Fish");
	}
	
	if (array_contains(global.inventory, "Pocket Fish")) {
		show_debug_message("has pockert fish")
	}
}