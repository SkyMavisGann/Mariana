
if y < 0 {
	y = y +1;
}


if (distance_to_object(obj_diver) < 800) {
	alignTentacles();
	if (age > maxAge && age % 500 == 0) {
		HP = HP - 1;
	}

	dist_x = obj_diver.x - x;
	dist_y = obj_diver.y - y;
	// DOCILE BEHAVIOR

	
		//DEATH -------------------------------------- Sprite input
		if (HP <= 0) {
	    swim_speed = 0;
		var myId = id;
		with (obj_oris_squid_tentacle) {
			if (squidId = myId) {
				instance_destroy();
			}
		}
		instance_create_layer(x, y, "player_layer", obj_Oris_Tentacle);
		audio_emitter_free(audio_emitter);
		instance_destroy();
		}


		if (flashAlpha > 0) {
			flashAlpha -= 0.02;
		}

	if (flashAlpha > 0.06) {
		var xway = x - obj_diver.x;
		var yway = y - obj_diver.y;
		if (!place_meeting(x + xway,y + yway, obj_collision_parent)) {
			move_towards_point(obj_diver.x, obj_diver.y, -3);	
		} else {
		speed = 0;
		}
	} else {
		if (flashAlpha = 0.06) {
	speed = 0;
		}
	}
	
	randomTimer++;
	if (randomTimer > maxRandomTimer) {
		randomize();
		randomTimer = 0;
		direction = irandom_range(0,360);
		speed = swim_speed;
		maxRandomTimer = irandom_range(500, 880);
	
	}
} else {
	speed = 0;
}
if (audio_emitter_exists(audio_emitter)) {
	audio_emitter_position(audio_emitter, x, y, 0);
}


var rando = irandom_range(1, 2);
if (delta_time % 50 == 0 && rando == 1) {
	audio_play_sound_on(audio_emitter, asset_get_index("sfx_oris_moan" + string(irandom_range(1, 3))), false, 1, global.volume_setting * 2, 0,voicePitch + random_range(-0.10, 0.10));
}