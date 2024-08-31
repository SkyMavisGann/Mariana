// get input
key_w = keyboard_check_pressed(obj_settings.key_up);
key_s = keyboard_check_pressed(obj_settings.key_down);
key_accept = keyboard_check_pressed(obj_settings.key_select);

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
if (keyboard_check_pressed(obj_settings.key_down)) {
	audio_play_sound(sfx_move_selected, 2 ,false, global.volume_setting);
}

if (keyboard_check_pressed(obj_settings.key_up)) {
	audio_play_sound(sfx_move_selected, 2 ,false, global.volume_setting);
}
