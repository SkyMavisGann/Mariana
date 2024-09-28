if ((distance_to_object(obj_diver) < 20) && global.inventoried == false && global.paused == false) {
	if (keyboard_check_pressed(obj_settings.key_select) || gamepad_button_check_pressed(0, gp_face1)) {
		opened = !opened;
		if (opened) {
		audio_play_sound_at(sfx_chest_close, x, y, 0, 100, 600, 1, false,2, global.volume_setting * 0.5, 0, 1);
		} else {
			audio_play_sound_at(sfx_chest_open, x, y, 0, 100, 600, 1, false,2, global.volume_setting * 0.5, 0, 1);
		}
	}
}


if opened == true {
image_index = 1;
if (array_length(container) > 0) {
	if (array_contains(global.inventory, "Lucky Seashell") != -1) {
		var rand = irandom_range(0, 10);
		if (rand == 1) {
			say(splitText("You got an extra sandwich. How lucky!"));
			instance_create_depth(x+randx, y+randy-10, depth-1, obj_Soggy_Sandwich);
		}
	}
}
for (var i = 0; i < array_length(container); i++) {
		var randx = irandom_range(-12,12);
		var randy = irandom_range(-12,0);
		instance_create_depth(x+randx, y+randy-10, depth-1, container[i]);
		if i = array_length(container)-1 {
			container = [];
		}
	}

} else {
	image_index = 0;
	
}
