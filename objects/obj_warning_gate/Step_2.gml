if (opening || array_contains(obj_settings.achivements, "GateOpened") != -1) {
	giveAchievement("GateOpened");
	steam_set_achievement("ACHIEVEMENT_OPEN_GATE");
	var index = (array_contains(obj_settings.achivements, "GateOpened"));
	if (array_length(obj_settings.achivements) == index + 1) {
		giveAchievement(0);
	}
	
	var frameTemp = obj_settings.achivements[index + 1] + curveSpeed;
	array_set(obj_settings.achivements, index + 1, frameTemp);
	
	frame = obj_settings.achivements[index + 1];
	x = followAnimationCurve(a_slowStartAbruptEnd,startingX , sprite_width-500);
	if (!audio_is_playing(sfx_large_scrape) && frame < 1) {
		if (room == Room2) {
			audio_play_sound_at(sfx_large_scrape, 5679, 11100, 10, 200, 5000, 2, true, 1, global.volume_setting, 0, 1);
		} else if (room == Room2_City1_Lever2) {
			audio_play_sound_at(sfx_large_scrape, 1252, 956, 10, 200, 5000, 2, true, 1, global.volume_setting, 0, 1);
		} 
	}
	if (audio_is_playing(sfx_large_scrape) && frame > 1) {
		audio_sound_gain(sfx_large_scrape, 0, 100);
	}
}