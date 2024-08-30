image_angle += rotationSpeed;
if (!audio_is_playing(sfx_gear)) {
	audio_play_sound_at(sfx_gear, x, y, 0, 20, 600, 3, true,2, global.volume_setting, 0, 1.5);
}