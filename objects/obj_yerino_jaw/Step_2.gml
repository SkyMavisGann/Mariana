if (instance_exists(obj_yerino)) {
	
	switch (obj_yerino.sprite_index) {
		case spr_yerino_mouth_move:
			if (obj_yerino.image_index < 2) {

				angleOffset = 16
				xOffset = 4;
				yOffset = 0;
				//if (obj_yerino.image_angle == 90) {
				//	//going down
				//	xOffset = 1 * sign(image_yscale);
				//	yOffset = 180 * sign(image_yscale);
				//}
				//if (obj_yerino.image_angle == -90) {
				//	xOffset = 4 * sign(obj_yerino.image_xscale);
				//	xOffset = 80 * sign(image_yscale);
				//}
			} else {
				xOffset = 4;
				yOffset = 50;
				angleOffset = 0;
			}
		break;
		case spr_yerino_hurt:
			xOffset = 4;
			yOffset = 0;
			angleOffset = 16
		break;
		default:
			xOffset = 4;
			yOffset = 0;
			angleOffset = 0;
		break;
	}
	childOf(0, yOffset, 1, 1 , angleOffset * sign(obj_yerino.image_xscale), obj_yerino)
	
} else {
	instance_destroy();
}