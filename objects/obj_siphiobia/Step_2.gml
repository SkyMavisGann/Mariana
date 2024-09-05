if (array_contains(global.bosses_beaten, "Siphi")) {
	instance_destroy();
	} else {
	if (instance_exists(obj_diver) && obj_diver.y > 11300) {
		age++;
		EEx = obj_diver.x;
		EEy = obj_diver.y;
			var pd = point_direction(x, y, EEx, EEy);
			var dd = angle_difference(image_angle,180 + pd);
			image_angle -= min(abs(dd), rotation_speed) * sign(dd);
			direction = image_angle;
			speed = -swim_speed;
			for (var i = 1; i < array_length(stemBody); ++i) {
				with (stemBody[i]) {
					var upperTent = allTentaclesAbove[myNumber - 1]; 

					var pd = point_direction(upperTent.x, upperTent.y, x, y);
					var dd = angle_difference(upperTent.image_angle,pd);
				
					upperTent.image_angle -= min(abs(dd), 10) * sign(dd);
				
				
				
					//var pd = upperTent.image_angle;
					//var dd = angle_difference(image_angle,pd);

					//image_angle -= min(abs(dd), 1) * sign(dd);
					var goalx = upperTent.x + (length * dsin(upperTent.image_angle + 90));
					var goaly = upperTent.y + (length * dcos(upperTent.image_angle + 90));
					x = goalx;
					y = goaly;
				
				}
			}
			loop += (delta_time / 5000);
			if (loop > 2500) {
				loop = 0;
				var rando = irandom_range(1, 2);
				switch (rando) {
					default:
						for (var i = 0; i < array_length(stemBody); i++) {
							if (stemBody[i].sprite_index == spr_stem) {
								stemBody[i].sprite_index = spr_stem_explode;
								audio_play_sound_at(sfx_zap,stemBody[i].x, stemBody[i].y, 0, 100, 1200, 2, false, 1, global.volume_setting / 4, 0, random_range(0.5, 0.8));
							}
						}
					break;
					case 2:
					for (var i = 0; i < array_length(stemBody); i++) {
						if (instance_exists(stemBody[i].zooid)) {
							if (stemBody[i].zooid.sprite_index == spr_zooid) {
								stemBody[i].zooid.sprite_index = spr_zooid_beam;
								audio_play_sound_at(sfx_zapSiph,stemBody[i].zooid.x, stemBody[i].zooid.y, 0, 100, 1200, 2, false, 1, global.volume_setting / 6, 0, random_range(1.2, 1.6));
							}
						}
					}
					break;
				}
			}
			if (!variable_instance_exists(id, "rand")) {
				rand = irandom_range(1, 2);
			}
			var seconds = current_time / 100;
			if (round(seconds) % 20 == 0) {
				if (rand == 2 && instance_exists(obj_diver)) {
					rand++;

				audio_play_sound_at(asset_get_index("sfx_siph" + string(irandom_range(1, 3))),x, y, 0, 100, 1200, 2, false, 1, global.volume_setting, 0, random_range(0.9, 1.25));
				}
			} else {
				rand = irandom_range(1, 2);	
			}
			
			
	} else {
		speed = 0;
	}


	stopDeadMusic(m_aquifer);

	if musicStart == true {
		musicFallToLoop(m_hydrogen_start, m_hydrogen_loop);
	}

	if distance_to_object(obj_diver) < 500 {

		if (musicStart == false) {
			switchMusicTo(m_aquifer, m_hydrogen_start, false, 4000);
			musicStart = true;
		}
		var hp = calculateRemainingZooids();
		if (hp <= 10) {
			image_blend = make_color_rgb(225, 225, 255)
			swim_speed = 6;
			if (audioOnce) {
				audio_play_sound(sfx_magic, 10, false, global.volume_setting * 2, 0, 0.6);
				audioOnce = false;
			}
		} 
		if (hp <= 0) {
			default_swim_speed = 0;
			swim_speed = 0;
	
		steam_set_achievement("ACHIEVEMENT_KILL_SIPH");
		if (audio_is_playing(m_hydrogen_loop)) {
			switchMusicTo(m_hydrogen_loop, m_victory, false, 0);
		} else {
			switchMusicTo(m_hydrogen_start, m_victory, false, 0);
		}
		if (!array_contains(global.bosses_beaten, "Siphi")) {
			array_push(global.bosses_beaten, "Siphi");
		}
		instance_create_layer(x, y, "player_layer", vfx_slunk);
		instance_destroy()
		}
	
	}
}