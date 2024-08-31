if ((distance_to_object(obj_diver) < 20) && global.inventoried == false && global.paused == false) {
	if keyboard_check_pressed(obj_settings.key_select) {
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

for (var i = 0; i < array_length(container); i++) {
		var randx = irandom_range(-12,12);
		var randy = irandom_range(-12,0);
		instance_create_layer(x+randx, y+randy-10, "player_layer", container[i]);
		if i = array_length(container)-1 {
			container = [];
		}
	}
} else {
	image_index = 0;
	
}
