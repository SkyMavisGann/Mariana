 /// @description get attacked
// You can write your code in this editor
if obj_diver.attacking = 1 {
	if (InFrames = 0) {
		InFrames = maxInFrames;
		flashAlpha = 1;
		HP -= global.attack_damage;
		audio_play_sound_at(sfx_stab,x, y, 0, 100, 500, 2, false, 1, global.volume_setting, 0, random_range(1.1, 1.6));
	}
}
