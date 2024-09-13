if (flashAlpha <= 0 && (sprite_index == spr_yerino_mouth_move)) {
	if ((image_xscale > 0 && (obj_diver.x >= x)) || (image_xscale < 0 && (obj_diver.x <= x))) {
		if image_index = 2 {
			deltAlph(damage + 1, x, y, 3);
		} else {
			if ((global.player_health % 2) = 0) {
				for (var i = 0; i < 2; i++) {
					if (instance_number(vfx_blood) < 10) {
						var blood = instance_create_layer(obj_diver.x, obj_diver.y, "behind_diver", vfx_blood);
						blood.from = obj_diver;
					}
				}
			}
			if (y > (room_height - 3000)) {
				deltAlph(damage + 1, x, y, 3);
			} else {
				deltAlph(damage , x, y, 3);
			}
		}
	}
}