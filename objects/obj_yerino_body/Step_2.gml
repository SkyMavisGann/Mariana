if (instance_exists(obj_yerino)) {
	x = obj_yerino.x + xOffset;
	y = obj_yerino.y + 9 + yOffset;
	
	switch (obj_yerino.sprite_index) {
		default:
			xOffset = 0;
			yOffset = 0;
		break;
	}
	
	if (sign(obj_yerino.image_xscale) != sign(image_xscale)) {
		image_xscale = -image_xscale;
	}
	image_angle = obj_yerino.image_angle;
} else {
	instance_destroy();
}