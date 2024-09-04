if (distance_to_object(obj_diver) < 800) {
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

	if (!place_meeting(x, y+1, obj_collision_parent)) {
		y = y + 1;
	}


	var followRange = 700;
	var attackRange = 400;
	if (distance_to_object(obj_diver) <= (followRange) && canAttack) {
		var distX = x - (obj_diver.x);
		if (distance_to_object(obj_diver) > attackRange) {
			if ((distX > 5 || distX < -5) && ((place_meeting(x+25, y+2, obj_collision_parent)) && (place_meeting(x-25, y+2, obj_collision_parent)))) {
				move_towards_point(obj_diver.x, y, swim_speed);
			} else {
				speed = 0;
			}
		} else {
			speed = 0;
			alarm[0] = 80;
			audio_play_sound_at(sfx_charge,x, y, 0, 100, 700, 2, false, 1, global.volume_setting, 0, random_range(0.9, 1.1));
			sprite_index = spr_Lostal_Attack;
			canAttack = false;
		}
	}
	if (sprite_index == spr_Lostal_Attack && image_index >= image_number - 1) {
		sprite_index = spr_Lostal;
		alarm[1] = 260;
	} 

	if ((distance_to_object(obj_diver) > (followRange) || !canAttack) && distance_to_object(obj_diver) < 800) {
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
		instance_destroy(crystal);
		audio_play_sound_at(sfx_shatter,x, y, 0, 100, 500, 2, false, 1, global.volume_setting / 2, 0, 1);
		instance_destroy();
		}
	if (!variable_instance_exists(id, "rando")) {
		rando = irandom_range(1, 2);
	}
	var seconds = current_time / 100;
	if (round(seconds) % 10 == 0) {
		if (rando == 2 && instance_exists(obj_diver)) {
			rando++;

		audio_play_sound_at(sfx_crab,x, y, 0, 100, 500, 2, false, 1, global.volume_setting / 2, 0, random_range(1.5, 1.7));
		audio_play_sound_at(sfx_magic,x, y, 0, 100, 500, 2, false, 1, global.volume_setting / 4, 0, random_range(0.5, 0.6));
		}
	} else {
		rando = irandom_range(1, 2);	
	}
		
}