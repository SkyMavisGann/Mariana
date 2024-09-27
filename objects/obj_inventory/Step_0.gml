// get input
key_A = keyboard_check_pressed(obj_settings.key_left) || (gamepad_button_check_pressed(0, gp_padl) || global.joystickPressHorizontal <= -0.8);
key_D = keyboard_check_pressed(obj_settings.key_right) || (gamepad_button_check_pressed(0, gp_padr) || global.joystickPressHorizontal >= 0.8);
key_accept = keyboard_check_pressed(obj_settings.key_select) || gamepad_button_check_pressed(0, gp_face1);

//storen number of otpions
op_length = array_length(global.inventory);


// enable clicking
if (room != room_shop_top && room != room_shop_middle) {
	for(var i = 0; i < array_length(buttons); i++) {
		var object = buttons[i];
		if (instance_exists(object) && object.hovering) {
			var newPos = object.index;
			if (pos != newPos) {
				pos = newPos;
				audio_play_sound(sfx_move_selected, 2, false, global.volume_setting);
			}
		}
		if (instance_exists(object) && object.pressed == true) {
			pos = object.index;
			audio_play_sound(sfx_select, 2, false, global.volume_setting);
			key_accept = true;
			buttons = [];
			with (obj_button) {
			instance_destroy();
			}
		}
	}
}

//move through menu
if (!instance_exists(obj_inventory_use)) {
pos += key_D - key_A;
}
if pos >= op_length {pos = 0};
if pos < 0 {pos = op_length -1};

//using menu
if !instance_exists(obj_inventory_use) && !instance_exists(obj_text) && (string_copy(room_get_name(room), 0, 9) != "room_shop") {
	if key_accept {
		if (array_length(global.inventory) > 0) {
	audio_play_sound(sfx_select, 2, false, global.volume_setting);
			var _sml = menu_level;
		
			instance_create_layer(0, 0, "menu_layer", obj_inventory_use);
			if (!instance_exists(obj_item_desc)) {
				instance_create_layer(0, 0, "menu_layer", obj_item_desc);
			}
			global.inventory_menu = true;
		
			// set pos back
			if _sml != menu_level {pos = 0};
	
			//correct option length
			op_length = array_length(global.inventory);

		}
	}
}
// sound
if (key_A || key_D) {
	audio_play_sound(sfx_move_selected, 2 ,false);
	audio_sound_gain(sfx_move_selected, global.volume_setting, 0);
}

if (global.equipped[6] == "Healthometer") {
	if (instance_exists(obj_health_bar)) {
		obj_health_bar.alpha = 1;
	}
}