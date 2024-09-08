// get input
key_w = keyboard_check_pressed(obj_settings.key_up);
key_s = keyboard_check_pressed(obj_settings.key_down);
key_accept = keyboard_check_pressed(obj_settings.key_select) || gamepad_button_check_pressed(0, gp_face1);

//storen number of otpions

if (key_accept == 1 || mouse_check_button_pressed(mb_any)) {
	if (draw_char >= text_length[menu_level]) {
		menu_level++;
		pos++;
		draw_char = 0;
	} else {
		draw_char = text_length[menu_level];
	}
audio_play_sound(sfx_select, 2 ,false, global.volume_setting);
	if (array_length(currentlySaying) > 3 && menu_level >= 3) {
		for (var i = 0; i < array_length(currentlySaying) - 3; i++) {
			currentlySaying[i] = currentlySaying[i + 3];
		}
	}
if (menu_level >= 3) {
		menu_level = 0;
	}
}

if (pos == (array_length(currentlySaying))) {
	room_goto(Room1);
}

