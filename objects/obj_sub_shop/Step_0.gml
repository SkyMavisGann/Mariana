if ((distance_to_object(obj_diver) < 15) && global.inventoried == false && global.paused == false) {
	if (keyboard_check_pressed(obj_settings.key_select) || gamepad_button_check_pressed(0, gp_face1)) {
		if ((array_contains(obj_settings.achivements, "SubShopped")) == -1) {
				array_push(obj_settings.achivements, "SubShopped");
		}
		audio_play_sound_at(sfx_valve_turn, x, y, 0, 100, 700, 2, false, 1, global.volume_setting, 0, 0.9);
		saveGame(string(curLocation) + ".save");
		room_goto(destination);
		loadGame(string(destination) + ".save", false);
		switch (room) {
			case Room1:
				obj_settings.previousRoom = room_shop_top;
			break;
			case Room2:
				obj_settings.previousRoom = room_shop_middle;
			break;
			case Room3:
			
			break;
		}
		
		
		obj_settings.timesEnteredSub++;
		// Don't forget to add dialogue at last dialogue - 0.5
		function stuntDialogue(lastDialouge, achievementName) {
			if (obj_settings.timesEnteredSub <= lastDialouge || array_contains(obj_settings.achivements, achievementName)) {
				if (obj_settings.timesEnteredSub == lastDialouge + 0.5) {
					obj_settings.timesEnteredSub = lastDialouge + 1;
				}
			} else {
				obj_settings.timesEnteredSub = lastDialouge - 0.5;
			}
		}
		//before finds light
		stuntDialogue(5, "Found light");
		//before finds thorium
		stuntDialogue(6, "Found thorium");
		
		
	}
}

