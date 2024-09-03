if (object_exists(obj_diver)) {
	if (obj_diver.attacking == 1) {
		sprite_index = harpoon;
		if (setIndexOnce) {
			image_index = 0;
			setIndexOnce = false;
		}
		x = obj_diver.x;
		y = obj_diver.y;
		switch (obj_diver.input_direction) {
			default:
				image_xscale = obj_diver.image_xscale;
				image_angle = 0;
			break;
			case 90:
				image_angle = obj_diver.input_direction;
				image_xscale = 1;
				y = obj_diver.y - 20;
			break;
			case 270:
				image_angle = obj_diver.input_direction; 
				image_xscale = 1;
				y = obj_diver.y + 20;
			break;
		}
	}
	
	if (obj_diver.attacking == 0) {
		setIndexOnce = true;
		sprite_index = harpoon_back;
		x = obj_diver.x;
		y = obj_diver.y;

		image_angle = (45 * sign(obj_diver.image_xscale));
		image_xscale = obj_diver.image_xscale;
	}
}