//DON"T DO ANYTHING IF YOU've AREADY BEATEN IT
if (array_contains(global.bosses_beaten, "Yerino")) {
	instance_destroy();
} else {
	default_swim_speed = 1 + clamp((obj_diver.y - 8500)/500, 0, 20)
	if y < 0 {
		y = y +1;
	}
	if (sharkTimer < 700) {
		sharkTimer++;
	}
	if (instance_exists(vfx_blood) && sharkTimer >= 700) {
		var shark = instance_create_layer(obj_diver.x + irandom_range(-200, 200), obj_diver.y - 500, "player_layer", obj_shark);
		shark.age = 10000;
		sharkTimer = 0;
	}
	
	// Target player

	if (obj_diver.y >= 8000 && (distance_to_object(obj_diver) > 400)) {
		move_towards_point(obj_diver.x, obj_diver.y, 3.6 + clamp((obj_diver.y - 8500)/500, 0, 20));
	} else {
		if (!(place_meeting(x, y+swim_speed, obj_collision_parent) || (place_meeting(x, y-swim_speed, obj_collision_parent)))) {
		speed = 0;
		}
	}

	if bTimer >= 1 {
		bTimer -= 1;
		speed = 0;
		}

	stopDeadMusic(m_surface_tension);

	if musicStart == true {
		musicFallToLoop(m_with_baited_breath_start, m_with_baited_breath_loop);
	}

	if distance_to_object(obj_diver) < 500 {

		if (musicStart == false) {
			switchMusicTo(m_surface_tension, m_with_baited_breath_start, false, 4000);
			musicStart = true;
		}
	
		if (InFrames >= 1) {
		 InFrames -= 1;
		}
	
		//DEATH -------------------------------------- Sprite input
		if (HP <= 0) {
		InFrames = 200; 
	    swim_speed = 0;
		sprite_index = spr_yerino_die;
		}
	}

	// attack knockback
	if (flashAlpha > 0) {
		flashAlpha -= 0.05;
	}

	if (flashAlpha > 0.05) {
		if (object_exists(obj_diver)) {
			move_towards_point(obj_diver.x, obj_diver.y, -3);
		}
	} 

		if (flashAlpha == 0.05) {
	speed = 0;
	sprite_index = spr_yerino;
		}

	//attacking stuff
	if distance_to_object(obj_diver) <= 1200 {
	loop++;
	}

	if (loop > 241) {
		if (flashAlpha <= 0.05) {
			move_towards_point(obj_diver.x,obj_diver.y, default_swim_speed);
		} else {
			move_towards_point(obj_diver.x, obj_diver.y, -6);
		}
		if (place_meeting(x,y,obj_diver) && (sprite_index = spr_yerino)) {
			sprite_index = spr_yerino_mouth_move;
		} else if (sprite_index = spr_yerino_mouth_move && (image_index = 3)) {
			sprite_index = spr_yerino;
		}
	}

	if (loop > 550) {
		loop = 0;
		var randAttack = irandom_range(0, 2);

		switch (randAttack) {
		case 0:
			attack = "diamond";
		break;
		case 1:
			attack = "column";
		break;
		case 2:
			attack = "screach";
		break;
		default:
			attack = "diamond";
		break;

		}

	}
	// always play
	if distance_to_object(obj_diver) <= 1000 {
		switch (attack) {
	
			case "diamond":
			attackDiamond();
			
			break;
	
			case "column":
			attackColumn();
			audio_play_sound_at(sfx_yerino2,x, y, 0, 100, 1200, 2, false, 1, global.volume_setting, 0, random_range(0.7, 1.1));
			break;
	
			case "screach":
			attackDeathScreach();
			audio_play_sound_at(sfx_yerino3,x, y, 0, 100, 1200, 2, false, 1, global.volume_setting, 0, random_range(1.0, 1.25));
			break;
	
			default:

			break;
		}

	}
	
}