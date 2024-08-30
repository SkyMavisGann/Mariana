if (distance_to_object(obj_diver) < 1000 || x == 0) {
	image_xscale = squidId.image_xscale * scaledValue;
	image_yscale = squidId.image_yscale * scaledValue;

	// check if you are the last tentacle
	if (sprite_index != spr_kelp_top) {
		if (myNumber == (array_length(allTentaclesAbove) - 1)) {
			sprite_index = spr_kelp_top;
			array_push(shines, instance_create_depth(x, y, depth-1, vfx_shine2));
			array_push(shines, instance_create_depth(x, y, depth-1, vfx_shine2));
			array_push(shines, instance_create_depth(x, y, depth-1, vfx_shine2));
		}
	}
	var spW = sprite_width;
	var spH = sprite_height;
	var me = id;
	if (array_length(shines) > 0) {
		with (shines[0]) {
			image_blend = make_color_rgb(255, 213, 73);
			childOf(-spW / 4, -spH / 1.75, 1, 1, 0, me);
		}
		with (shines[1]) {
			image_blend = make_color_rgb(255, 213, 73);
			childOf(-spW / 8, -spH / 3, 1, 1, 0, me);
		}
		with (shines[2]) {
			image_blend = make_color_rgb(255, 213, 73);
			childOf(spW / 6, -spH / 2, 1, 1, 0, me);
		}
	}
	
	// calculate position based on angle and length and angle of previous tentacle
	if (myNumber != 0) {
		var upperTent = allTentaclesAbove[myNumber - 1]; 
		x = upperTent.x - (sprite_height * dsin(upperTent.image_angle));
		y = upperTent.y - (sprite_height * dcos(upperTent.image_angle));
	}


	if (distance_to_object(obj_any_behavior_parent) < 500) {
		if (image_angle >= 361) {
			image_angle = 1;
		}

		if (image_angle <= -1) {
			image_angle = 359;
		}
		
		//rotate if player interacts
		if (place_meeting(x, y, obj_any_behavior_parent)) {
			var pint = point_direction(x, y, obj_any_behavior_parent.x, obj_any_behavior_parent.y) ;
			if (pint < 270) {
				if (obj_any_behavior_parent.x >= obj_any_behavior_parent.xprevious) {
					image_angle--;
				} else {
					image_angle++;
				}
		
			} else if (point_direction(x, y, obj_any_behavior_parent.x, obj_any_behavior_parent.y) >= 270) {
				if (obj_any_behavior_parent.x <= obj_any_behavior_parent.xprevious) {
					image_angle++;
				} else {
					image_angle--;
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