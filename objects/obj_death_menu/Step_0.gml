// get input
key_w = keyboard_check_pressed(obj_settings.key_up);
key_s = keyboard_check_pressed(obj_settings.key_down);
key_accept = keyboard_check_pressed(obj_settings.key_select);

//storen number of otpions
op_length = array_length(option[menu_level]);

//move through menu
pos += key_s - key_w;
if pos >= op_length {pos = 0};
if pos < 0 {pos = op_length -1};

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
		buttons = [];
		instance_destroy(obj_button);
	}

}

//using menu
if key_accept {
audio_play_sound(sfx_select, 2, false, global.volume_setting);
	var _sml = menu_level;
		
	switch (menu_level) {
	
		//pause menu
		case 0:
			switch(pos) {
			//try again
			case 0:
				room_goto(Room1);
				obj_settings.code = "none";
				obj_settings.needsDeathLoaded = true;
				obj_settings.loadPlayer = true;
			break;
			//game end
		    case 1: game_end(); break;
			 }
		 break;
			}
	// set pos back
	if _sml != menu_level {pos = 0};
	
	//correct option length
	op_length = array_length(option[menu_level]);

}