 /// @description get attacked
// You can write your code in this editor
// Hurt ----------------------------------------Sprite Input
if obj_diver.attacking = 1 {
	if (InFrames = 0) {
		if (flashAlpha <= 0) {
			obj_diver.DiverCollidedInAttack = true;
			audio_play_sound_at(sfx_stab,x, y, 0, 100, 500, 2, false, 1, global.volume_setting, 0, random_range(0.8, 1.1));
		}
		InFrames = maxInFrames;
		flashAlpha = 1;
		HP -= global.attack_damage;
	}
}

