 /// @description get attacked
// You can write your code in this editor
// Hurt ----------------------------------------Sprite Input
if obj_diver.attacking = 1 {
	if (InFrames = 0) {
	InFrames = maxInFrames;
	flashAlpha = 1;
	sprite_index = spr_yerino_hurt;
	HP -= global.attack_damage;
	moving = 1;
	audio_play_sound_at(sfx_yerino2,x, y, 0, 100, 1200, 2, false, 1, global.volume_setting, 0, random_range(1.2, 1.5));
	}
}

