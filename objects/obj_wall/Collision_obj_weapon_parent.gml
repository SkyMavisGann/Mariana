if (obj_diver.attacking == 1) {
	if (obj_diver.aTimer > 56) {
		obj_diver.DiverCollidedInAttack = true;
		audio_play_sound_at(sfx_sand,x, y, 0, 100, 500, 2, false, 1, global.volume_setting, 0, random_range(0.8, 1.1));
	}
}

if (obj_diver.attacking == 1) {
	if (obj_diver.aTimer > 36 && obj_diver.aTimer < 38) {
		obj_diver.DiverCollidedInAttack = true;
		audio_play_sound_at(sfx_sand,x, y, 0, 100, 500, 2, false, 1, global.volume_setting, 0, random_range(0.8, 1.1));
	}
}