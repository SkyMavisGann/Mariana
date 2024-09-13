image_xscale -= 0.1;
image_yscale -= 0.1;
if (image_xscale <= 0) {
	
	if global.max_player_health < 10 {
		say(["Your resolve strengthens."]);
		global.max_player_health += 1;
		obj_health_bar.alpha = 5;
		obj_health_bar.needToAnimateBreak = true;
		obj_health_bar.frame = 0.9;
		obj_health_bar.curveSpeed = -0.05;
		audio_play_sound(sfx_Gain_Health, 1, false, global.volume_setting, 0, 1);
											
											
		if (global.max_player_health == 10) {
			steam_set_achievement("ACHIEVEMENT_MAX_HEALTH");
		}
	}
	instance_destroy();				
}

move_towards_point(obj_diver.x, obj_diver.y, 4);