
if (!instance_exists(obj_inventory_use) || !instance_exists(obj_inventory)) {
	instance_destroy();
}

if (global.inventory[obj_inventory.pos] != itemName) {
	pos = 0;
	menu_level = 0;
	textToDisplay = [""];
	itemName = global.inventory[obj_inventory.pos];
	object = convertTo("obj", itemName);
	var tempObj = instance_create_layer(-100, 100, "player_layer", object);
	if (variable_instance_exists(tempObj, "description")) {
		textToDisplay = splitTextLength(tempObj.description, 725);
	}
	
	text_length[0] = string_length(textToDisplay[0]);
	draw_char = 0;
	setup = false;
}
var length = array_length(textToDisplay);

if (keyboard_or_mouse_check_pressed(mb_any)) {
	if (draw_char >= text_length[menu_level]) {
		pos++;
		if (pos != length) {
			menu_level++;
		}
		draw_char = 0;
	} else {
		draw_char = text_length[menu_level];
	}
		audio_play_sound(sfx_select, 2 ,false, global.volume_setting);
		
	if (array_length(textToDisplay) > 3 && menu_level >= 3) {
		for (var i = 0; i < array_length(textToDisplay) - 3; i++) {
			textToDisplay[i] = textToDisplay[i + 3];
		}
	}
}


if (pos == length) {
	instance_destroy();
}
if (pos != length-1) {
	if (draw_char >= text_length[menu_level]) {
		menu_level++;
		pos++;
		draw_char = 0;
	} 
}

