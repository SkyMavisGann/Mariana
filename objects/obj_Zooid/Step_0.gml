if (HP <= 0) {
	if (flashAlpha == 0) {
		flashAlpha = 1;
		instance_destroy();
	}
}

if (flashAlpha > 0) {
	flashAlpha -= 0.02;
	if (soundOnce) {
		audio_play_sound_at(sfx_splat,x, y, 0, 100, 500, 2, false, 1, global.volume_setting / 2, 0, random_range(0.8, 1.1));
		soundOnce = false;
	}
}

if (sprite_index = spr_zooid_beam && image_index >= image_number - 1) {
	sprite_index = spr_zooid;
}