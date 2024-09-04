
if distance_to_object(obj_diver) < range {
	age++;
	image_xscale = clamp(scale, 0.6, 2);
	image_yscale = clamp(scale, 0.6, 2);
	scale = age / 2000;

	if (age > maxAge && age % 500 == 0) {
		HP = HP - 1;
	}

	if bTimer >= 1 {
		bTimer -= 1;
		move_towards_point(obj_diver.x+randX, obj_diver.y+randY, -swim_speed);
		charge_attack = 0;
	}
	if (HP == maxHP) {
		charge_attack = 0;			
	}
	if ((HP < maxHP) || hostile == true) {
		if (distance_to_object(obj_diver) < 450) {
			if (getPosOnce == false) {
				getPosOnce = true;
				diverx = obj_diver.x + ((obj_diver.x - x)/2);
				divery = obj_diver.y + ((obj_diver.y - y)/2) - 20;
			}

		dist_x = obj_diver.x - x;
		dist_y = obj_diver.y - y;
		// DOCILE BEHAVIOR
			// Get the distance to the player
			if (distance_to_object(obj_diver) < 449 || hostile == true) { 
					swim_speed = 3;
					
					if (abs(x - diverx) > swim_speed && abs(y - divery) > swim_speed) {
						if (bTimer < 1) {
							move_towards_point(diverx, divery, swim_speed+1);
							if (instance_number(obj_poison) < 50 && age % 40 == 0) {
								instance_create_layer(x, y, "player_layer", obj_poison);
							}
							charge_attack = 1;
						}
				} else {
				bTimer = 140;
				getPosOnce = false;
				randX = irandom_range(-50,50);
				randY = irandom_range(-50,50);
				}
			}
			
			if ((HP >= maxHP)) {
				swim_speed = default_swim_speed;
			}

			//DEATH -------------------------------------- Sprite input
			if (HP <= 0) {
			flashAlpha = 1;
		    swim_speed = 0;
			speed = 0;
			instance_destroy();
			}
		} 
	} else {	
			if (age > 12000 && laidEggs = false && (HP >= maxHP)) {
				var nearestSand = instance_nearest(x, y, obj_collision_parent);
				if (distance_to_object(nearestSand) > 5) {
					move_towards_point(nearestSand.x, nearestSand.y, swim_speed);
					layingEggsAge = age;
				} else {
					speed = 0;
					if (age - layingEggsAge > 700) {
						for (var i = 0; i < 4; i++;) {
							if (irandom_range(1, 2) == 2) {
								var guppy = instance_create_layer(x, y, "player_layer", obj_shark);
								guppy.x = x + irandom_range(-5, 5);
								guppy.y = y + irandom_range(-2, 8);
							}
						}
						laidEggs = true;
					}
				}
			} else {
				if (age % switchDirTime == 0) {
					var rand = irandom_range(0, 1);
					var rand2 = irandom_range(-10, 10);
					switch (needsToMoveLeftRight) {
						case 0:
							direction = 180;
						break;
						case 1:
							direction = 0;
						break;
						case -1:
							direction = rand * 180 + rand2;
						break;
					}
					speed = swim_speed;
					switchDirTime = irandom_range(200, 600);
				} 
				
			}
		}

	if (flashAlpha > 0) {
		flashAlpha -= 0.02;
	}

	if (flashAlpha > 0.06) {
		move_towards_point(obj_diver.x, obj_diver.y, -3);	
	} else {
		if (flashAlpha = 0.06) {
	speed = 0;
		}
	}

} else {
	speed = 0;
}
