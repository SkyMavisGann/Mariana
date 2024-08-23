if (distance_to_object(obj_diver) < 800) {
	/// @description Insert description here
	// You can write your code in this editor
		if (InFrames >= 1) {
		 InFrames -= 1;
		}
	
	


	if (flashAlpha > 0) {
		flashAlpha -= 0.05;
	}

	if (flashAlpha > 0.05) {
		move_towards_point(obj_diver.x, obj_diver.y, -swim_speed);
	} else {
		if (flashAlpha = 0.05) {
	speed = 0;
		}
	}

	age++;

	rightArm.x = x -10;
	rightArm.y = y;
	rightArm.image_angle = rightArmRotation


	leftArm.x = x + 10;
	leftArm.y = y;
	leftArm.image_angle = leftArmRotation;


	
	
	if (!place_meeting(x, y+1, obj_collision_parent)) {
		y = y + 1;
	}


	var attackRange = 40;
	if (distance_to_object(obj_diver) <= attackRange || distance_to_object(obj_docile_behavior_parent) <= attackRange) {
		if (distance_to_object(obj_diver) < attackRange) {
			var distX = x - (obj_diver.x);
			var adjustedAngle = 0;
			if ((distX > 5 || distX < -5) && ((place_meeting(x+25, y+2, obj_collision_parent)) && (place_meeting(x-25, y+2, obj_collision_parent)))) {
				move_towards_point(obj_diver.x, y, swim_speed);
				adjustedAngle = point_direction(x, y, obj_diver.x, obj_diver.y) + 270;
			} else {
				speed = 0;
				adjustedAngle = point_direction(x, y, obj_diver.x, obj_diver.y) + 270;
			}
		} else if (distance_to_object(obj_docile_behavior_parent < attackRange && ((place_meeting(x+25, y+2, obj_collision_parent)) && (place_meeting(x-25, y+2, obj_collision_parent))))) {
			var instance = instance_nearest(x, y, obj_docile_behavior_parent);
			if (!instance_exists(instance)) {
				instance = id;
			}
				move_towards_point(instance.x, y, swim_speed);
				adjustedAngle = point_direction(x, y, instance.x, instance.y) + 270;
		} else {
			speed = 0;
			adjustedAngle = point_direction(x, y, instance.x, instance.y) + 270;
		}
		
		rightArmRotation = adjustedAngle;
		leftArmRotation = adjustedAngle;
		if (subimg < 5) {
			if (age % 2 == 0) {
				subimg++;

			}
		}
	} else {
		rightArmRotation = 0
		leftArmRotation = 0;
		if (subimg >= 1) {
			if (age & 2 == 0) {
				subimg--;
			}
		}
	}

	if (distance_to_object(obj_diver) > attackRange && distance_to_object(obj_diver) < 600) {
		//movement
		if (age % randomNum == 0 && needsToStop == false) {
			randomize();
			var dir = irandom_range(0, 1);
			switch (needsToMoveLeftRight) {
			case 0:
				direction = 180;
			break;
			case 1:
				direction = 0;
			break;
			case -1:
				direction = (dir * 180);
			break;
			}
	
			speed = swim_speed;
			randomNum = irandom_range(60, 200);
			needsToStop = true;
		}

		if (needsToStop == true && (age % (randomNum + irandom_range(50, 100)) == 0)) {
			speed = 0;
			needsToStop = false;
		}
	}
	
		//DEATH -------------------------------------- Sprite input
		if (HP <= 0) {
		InFrames = 200; 
	    swim_speed = 0;
		//instance_create_layer(x, y, "player_layer", obj_Luciferin);
		instance_destroy(rightArm);
		instance_destroy(leftArm);
		instance_destroy();
		}
	if (!variable_instance_exists(id, "rando")) {
		rando = irandom_range(1, 2);
	}
	var seconds = current_time / 100;
	if (round(seconds) % 10 == 0) {
		if (rando == 2 && instance_exists(obj_diver)) {
			rando++;

		audio_play_sound_at(sfx_crab,x, y, 0, 100, 500, 2, false, 1, global.volume_setting / 2, 0, random_range(0.9, 1.25));
		}
	} else {
		rando = irandom_range(1, 2);	
	}
		
}