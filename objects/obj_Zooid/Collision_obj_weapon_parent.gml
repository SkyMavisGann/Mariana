 /// @description get attacked
// You can write your code in this editor
// Hurt ----------------------------------------Sprite Input
if obj_diver.attacking = 1 {
	if (flashAlpha = 0) {
		audio_play_sound_at(sfx_splat, x, y, 10, 100, 1000, 2, false, 1, global.volume_setting, 0, 1);
		flashAlpha = 1;
		HP -= global.attack_damage;
	}
}

