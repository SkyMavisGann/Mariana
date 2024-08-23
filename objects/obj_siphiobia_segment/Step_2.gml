if (array_contains(obj_settings.achivements, "Lunked") && instance_exists(obj_diver)) {
	move_towards_point(obj_diver.x, obj_diver.y, 4);
}

	// check if you are the last tentacle
	if (myNumber == (array_length(allTentaclesAbove) - 1)) {
		sprite_index = noone;
		if (zooid != noone) {
				instance_destroy(zooid);
		}
	}

	if (sprite_index != spr_stem_end) {
		if (myNumber == (array_length(allTentaclesAbove) - 2)) {
			sprite_index = spr_stem_end;
			if (zooid != noone) {
				instance_destroy(zooid);
			}
		}
	}
	// calculate position based on angle and length and angle of previous tentacle
	if (myNumber == 0) {
		if (zooid != noone) {
			instance_destroy(zooid);
		}
		var upperTent = obj_siphiobia;
		if (instance_exists(upperTent)) {
			var goalx = upperTent.x + (length * dsin(upperTent.image_angle + 90));
			var goaly = upperTent.y + (length * dcos(upperTent.image_angle + 90));
			x = goalx;
			y = goaly;
		}
	}
	
if (sprite_index = spr_stem_explode && image_index >= image_number - 1) {
	sprite_index = spr_stem;
}

