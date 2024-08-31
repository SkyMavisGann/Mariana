if (instance_number(vfx_blood) < 10) {
	var blood = instance_create_layer(x, y, "player_layer", vfx_blood);
	blood.image_xscale = 0.5;
	blood.image_yscale = 0.5;
	blood.from = asset_get_index(object_index);
	audio_play_sound_at(sfx_stab,x, y, 0, 100, 500, 2, false, 1, global.volume_setting, 0, random_range(1.1, 1.6));
}
HP -= 5;