if (!audio_is_playing(sfx_stone) && obj_diver.attacking == 1) {
	audio_play_sound_at(sfx_stone,x, y, 0, 100, 500, 2, false, 1, global.volume_setting, 0, random_range(0.8, 1.1));
}