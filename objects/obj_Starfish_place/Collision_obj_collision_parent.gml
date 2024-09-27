if (speed != 0) {
	if (flashAlpha == 0) {
		if (object_exists(obj_diver)) {
			if (!place_meeting(x, y, obj_diver)) {
				if (once == false) {
					once = true;
					alarm[0] = 15;
				}
			}
		}
	}
}