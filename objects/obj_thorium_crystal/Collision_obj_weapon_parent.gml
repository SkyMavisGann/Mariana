if obj_diver.attacking = 1 {
	audio_play_sound_at(sfx_shatter, x, y, 20, 15, 500, 3, false, 1, global.volume_setting / 4, 0, 0.7);
	instance_create_layer(x, y, "player_layer", obj_Thorium);
	instance_destroy(shine);
	instance_destroy();
}