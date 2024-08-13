

//remove 1 from timer every tick
if musicTimer >= 1 {musicTimer -= 1;}

stopDeadMusic(m_surface_tension);
stopDeadMusic(m_thorium);
stopDeadMusic(m_shifting_tide);
stopDeadMusic(m_watery_grave);
stopDeadMusic(m_hull_sale);
stopDeadMusic(m_are_there_any_crabs_in_here);
stopDeadMusic(m_The_5th_Wall);
stopDeadMusic(m_brine);

//play music
if (musicTimer = 0) {
	switch (room) {
	case Room1:
	audio_sound_gain(m_thorium, 0, 1000);
	audio_sound_gain(m_shifting_tide, 0, 1000);
	
		if (!audio_is_playing(m_surface_tension)) {
			if (!audio_is_playing(m_with_baited_breath_start)) {
				audio_sound_gain(m_surface_tension, 0, 0);
				audio_sound_gain(m_surface_tension, global.volume_setting, 4000);
				audio_play_sound(m_surface_tension, 1000, true);
			}
		}
		break;
	case Room2:
		audio_sound_gain(m_surface_tension, 0, 600);
		audio_sound_gain(m_The_5th_Wall, 0, 600);
		audio_sound_gain(m_hull_sale, 0, 600);
		audio_sound_gain(m_brine, 0, 600);
		if (!audio_is_playing(m_aquifer)) {
			audio_sound_gain(m_aquifer, 0, 0);
			audio_sound_gain(m_aquifer, global.volume_setting, 4000);
			audio_play_sound(m_aquifer, 1000, true);
		}
		break;
	case room_shop_top:
	audio_sound_gain(m_surface_tension, 0, 1000);
	
	audio_sound_gain(m_hull_sale, 0, 0);
	audio_sound_gain(m_hull_sale, global.volume_setting, 1000);
	if (audio_is_playing(m_hull_sale) != true) {
	audio_play_sound(m_hull_sale, 1000, true);
	}
		break;
	case roomStartScreen:
		audio_sound_gain(m_watery_grave, global.volume_setting, 4000);
		audio_play_sound(m_watery_grave, 1000, true);
		break;
	case Room1_thorium1:
	//Standard
	// fade music would be playing then stop dead music
	//set volume to zero
	//set to volume setting with fade then if the song isn't already playing play it
		audio_sound_gain(m_surface_tension, 0, 600);
		
		audio_sound_gain(m_thorium, 0, 0);
		audio_sound_gain(m_thorium, global.volume_setting, 2000);
		if (audio_is_playing(m_thorium) != true) {
			audio_play_sound(m_thorium, 1000, true);
		}
	break;
	case Room1_side1:
	//Standard
	// fade music would be playing then stop dead music
	//set volume to zero
	//set to volume setting with fade then if the song isn't already playing play it
		audio_sound_gain(m_surface_tension, 0, 600);
		
		audio_sound_gain(m_shifting_tide, 0, 0);
		audio_sound_gain(m_shifting_tide, global.volume_setting, 2000);
		if (audio_is_playing(m_shifting_tide) != true) {
			audio_play_sound(m_shifting_tide, 1000, true);
		}
	break;
	case Room1_side2:
		audio_sound_gain(m_shifting_tide, global.volume_setting, 2000);
		if (audio_is_playing(m_shifting_tide) != true) {
			audio_play_sound(m_shifting_tide, 1000, true);
		}
	break;
	case Room1_Harpoon1:
		audio_sound_gain(m_there_is_definitely_a_crab_in_here, 0, 600);
		audio_sound_gain(m_are_there_any_crabs_in_here, 0, 600);
		audio_sound_gain(m_surface_tension, global.volume_setting, 2000);
		if (audio_is_playing(m_surface_tension) != true) {
			audio_play_sound(m_surface_tension, 1000, true);
		}
	break;
	case Room1_Harpoon2:
	//Standard
	// fade music would be playing then stop dead music
	//set volume to zero
	//set to volume setting with fade then if the song isn't already playing play it
		audio_sound_gain(m_surface_tension, 0, 600);
		if (audio_is_playing(m_there_is_definitely_a_crab_in_here) != true) {
			if (audio_is_playing(m_are_there_any_crabs_in_here) != true) {
				audio_sound_gain(m_are_there_any_crabs_in_here, 0, 0);
				audio_sound_gain(m_are_there_any_crabs_in_here, global.volume_setting, 2000);
				audio_play_sound(m_are_there_any_crabs_in_here, 1000, true);
			}
		}
	break;
	case Room2_City1:
	//Standard
	// fade music would be playing then stop dead music
	//set volume to zero
	//set to volume setting with fade then if the song isn't already playing play it
		audio_sound_gain(m_aquifer, 0, 600);
		var switchto = m_The_5th_Wall;
		if (audio_is_playing(switchto) != true) {
			audio_sound_gain(switchto, 0, 0);
			audio_sound_gain(switchto, global.volume_setting, 2000);
			audio_play_sound(switchto, 1000, true);
		}
	break;
	
	case Room2_Brine1:
	//Standard
	// fade music would be playing then stop dead music
	//set volume to zero
	//set to volume setting with fade then if the song isn't already playing play it
		audio_sound_gain(m_aquifer, 0, 600);
		var switchto = m_brine;
		if (audio_is_playing(switchto) != true) {
			audio_sound_gain(switchto, 0, 0);
			audio_sound_gain(switchto, global.volume_setting, 2000);
			audio_play_sound(switchto, 1000, true);
		}
	break;
	case room_shop_middle:
	//Standard
	// fade music would be playing then stop dead music
	//set volume to zero
	//set to volume setting with fade then if the song isn't already playing play it
		audio_sound_gain(m_aquifer, 0, 600);
		var switchto = m_hull_sale;
		if (audio_is_playing(switchto) != true) {
			audio_sound_gain(switchto, 0, 0);
			audio_sound_gain(switchto, global.volume_setting, 2000);
			audio_play_sound(switchto, 1000, true);
		}
	break;
	
	
	

	}
	musicTimer = -100;
	alarm[0] = 3;
}
