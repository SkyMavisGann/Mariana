

if distance_to_object(obj_diver) < 350 {
	show_debug_message(distance_to_object(obj_diver));
	if bTimer >= 1 {
		bTimer -= 1;
		if (!place_meeting(x, y, obj_collision_parent)) {
			move_towards_point(obj_diver.x+randX, obj_diver.y+randY, -(swim_speed + 1));
		}
		charge_attack = 0;
		if (bTimer == 2) {
			instance_create_layer(x, y, "light", obj_electricity);
		}
	}

	path_speed = swim_speed;
	dist_x = obj_diver.x - x;
	dist_y = obj_diver.y - y;
	// DOCILE BEHAVIOR
		if ((HP < maxHP) || hostile == true) {
		
			// Get the distance to the player
		
			if ((dist_y < 5 && dist_x < 100) || hostile == true) { 
					path_end();
					path_ended = "true";
					if (!place_meeting(x,y,obj_diver)) {
						if (bTimer < 1) {
							if (!place_meeting(x, y, obj_collision_parent)) {
								move_towards_point(obj_diver.x, obj_diver.y, swim_speed);
							}
							charge_attack = 1;
						}
				} else {
				bTimer = 60;
				randX = irandom_range(-50,50);
				randY = irandom_range(-50,50);
				}
			}
	}
		if (InFrames >= 1) {
		 InFrames -= 1;
		}
	
		//DEATH -------------------------------------- Sprite input
		if (HP <= 0) {
		InFrames = 200; 
	    swim_speed = 0;
		if (irandom_range(0,1) == 0) {
			instance_create_layer(x, y, "player_layer", obj_Scrap);
		}
		instance_destroy();
		}


	if (flashAlpha > 0) {
		flashAlpha -= 0.05;
	}

	if (flashAlpha > 0.05) {
		move_towards_point(obj_diver.x, obj_diver.y, -3);
	} else {
		if (flashAlpha = 0.05) {
	speed = 0;
		}
	}

}