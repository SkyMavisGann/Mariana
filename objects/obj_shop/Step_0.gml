// get input
key_w = (keyboard_check_pressed(obj_settings.key_up) || (gamepad_button_check_pressed(0, gp_padu)) || global.joystickPressVertical <= -0.8);
key_s = (keyboard_check_pressed(obj_settings.key_down) || (gamepad_button_check_pressed(0, gp_padd)) || global.joystickPressVertical >= 0.8);

key_accept = keyboard_check_pressed(obj_settings.key_select) || gamepad_button_check_pressed(0, gp_face1);

//storen number of otpions
op_length = array_length(option[menu_level]);

//move through menu
if (!instance_exists(obj_text)) {
	if (!instance_exists(obj_shop_accept)) {
		pos += key_s - key_w;
	}
}

// enable clicking
for(var i = 0; i < array_length(buttons); i++) {
	var object = buttons[i];
	if (object.hovering) {
		var newPos = object.index;
		if (pos != newPos) {
			pos = newPos;
			audio_play_sound(sfx_move_selected, 2, false, global.volume_setting);
		}
	}
	if (object.pressed == true) {
		pos = object.index;
		key_accept = true;
		audio_play_sound(sfx_select, 2, false, global.volume_setting);
	}
}

if pos >= op_length {pos = 0};
if pos < 0 {pos = op_length -1};

//using menu
if (!instance_exists(obj_text)) {
	visible = true;
	if (global.beingYerinoChased) {
		if (room == room_shop_top) {
			destination = Room1;
		} else {
			destination = Room2;
		}
		room_goto(destination);
		loadGame(string(destination) + ".save", false);
	
		audio_stop_sound(m_surface_tension);
		audio_sound_gain(m_hull_sale, 0, 5000);
		
	}

		if (key_accept) {
			audio_play_sound(sfx_select, 2, false, global.volume_setting);
			var _sml = menu_level;
		
			switch (menu_level) {
	
				case 0:
					switch (pos) {
					 case 12:
						 menu_level = 2;
						 instance_destroy(obj_shop_accept);	
					 break;
					default:
						if !instance_exists(obj_shop_accept) {
							alarm[0] = 1;
						}
					break;
					}
				 break;
				
				 case 1:
					switch (pos) {
					case 1: 
						menu_level = 0;
					break;
					}
				 break;
				 case 2:
					switch (pos) {
						case 0: 
							global.inventoried = true;
							menu_level = 0;
						break;
						case 1:
							menu_level = 3;
						break;
						case 2:
						if (room == room_shop_top) {
							destination = Room1;
						} else {
							destination = Room2;
						}
							room_goto(destination);
							loadGame(string(destination) + ".save", false);
	
							audio_stop_sound(m_surface_tension);
							audio_sound_gain(m_hull_sale, 0, 5000);
						break;
						
					}
				 break;
				 case 3:
				 
					switch (pos) {
						default:
							if (!instance_exists(obj_text)) {
								alarm[1] = 1;
							}
						break;
					case 4:
						menu_level = 2;
					break;
					}
				 break;
	 
				}
		
			// set pos back
			if _sml != menu_level {pos = 0};
	
			//correct option length
			op_length = array_length(option[menu_level]);

		}
} else {
	visible = false;
}

// sound
// sound
if (key_s) {
	audio_play_sound(sfx_move_selected, 2 ,false);
	audio_sound_gain(sfx_move_selected, global.volume_setting, 0);
}

if (key_w) {
	audio_play_sound(sfx_move_selected, 2 ,false);
	audio_sound_gain(sfx_move_selected, global.volume_setting, 0);
}