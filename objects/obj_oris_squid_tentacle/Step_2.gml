if (distance_to_object(obj_diver) < 800 || x == 0 || alignOnce) {
	alignOnce = false;
	flashAlpha = squidId.flashAlpha;
	image_xscale = squidId.image_xscale * scaledValue;
	image_yscale = squidId.image_yscale * scaledValue;

	// check if you are the last tentacle
	if (sprite_index != spr_oris_squid_tentacle_end) {
		if (myNumber == (array_length(allTentaclesAbove) - 1)) {
			sprite_index = spr_oris_squid_tentacle_end;
			image_index = irandom_range(0, 1);
		}
	}
	// calculate position based on angle and length and angle of previous tentacle
	if (myNumber != 0) {
		var upperTent = allTentaclesAbove[myNumber - 1]; 
		var TentacleX = upperTent.x + (sprite_height * dsin(upperTent.image_angle));
		var TentacleY = upperTent.y + (sprite_height * dcos(upperTent.image_angle));
		x = TentacleX;
		y = TentacleY;
	}


	if (distance_to_object(obj_diver) < 500) {
		if (image_angle >= 361) {
			image_angle = 1;
		}

		if (image_angle <= -1) {
			image_angle = 359;
		}
		
		//rotate if player interacts
		if (place_meeting(x, y, obj_diver)) {
			var pint = point_direction(x, y, obj_diver.x, obj_diver.y) ;
			if (pint < 270) {
				if (obj_diver.x >= obj_diver.xprevious) {
					image_angle++;
				} else {
					image_angle--;
				}
		
			} else if (point_direction(x, y, obj_diver.x, obj_diver.y) >= 270) {
				if (obj_diver.x <= obj_diver.xprevious) {
					image_angle--;
				} else {
					image_angle++;
				}
		
			}
		} else {
			if (image_angle != 0) {
				if (image_angle >= 180) {
					image_angle += 0.5;
				} else {
					image_angle -= 0.5;
				}
			}
		}
	}
}