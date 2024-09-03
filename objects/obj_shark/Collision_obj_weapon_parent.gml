 /// @description get attacked
// Hurt ----------------------------------------Sprite Input
if obj_diver.attacking = 1 {
	
	if (flashAlpha == 0) {
		obj_diver.DiverCollidedInAttack = true;
		flashAlpha = 1;
		HP -= global.attack_damage;
		moving = 1;
		audio_play_sound_at(sfx_stab,x, y, 0, 100, 500, 2, false, 1, global.volume_setting, 0, random_range(1.1, 1.6));
	}
}

