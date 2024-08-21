

	// check if you are the last tentacle
	if (myNumber == (array_length(allTentaclesAbove) - 1)) {
		sprite_index = noone;
	}

	if (sprite_index != spr_Brine_Worm_tail) {
		if (myNumber == (array_length(allTentaclesAbove) - 2)) {
			sprite_index = spr_Brine_Worm_tail;
		}
	}
	// calculate position based on angle and length and angle of previous tentacle
	if (myNumber == 0) {
		if (instance_exists(squidId)) {
			var goalx = squidId.x + (length * dsin(squidId.image_angle + 90));
			var goaly = squidId.y + (length * dcos(squidId.image_angle + 90));
			x = goalx;
			y = goaly;
		}
	}

