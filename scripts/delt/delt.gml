// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function delt(deltDamage, Fx, Fy) {
	if (obj_diver.flashAlpha <= 0) {
		global.player_health -= deltDamage;
		obj_diver.flashAlpha = 1;
		obj_diver.attackedFromX = Fx;
		obj_diver.attackedFromY = Fy;
		obj_health_bar.alpha = 5;
		obj_health_bar.needToAnimateBreak = true;
		var damSound = (asset_get_index("sfx_damageTake" + string(irandom_range(0,2))));
		audio_sound_gain(damSound, global.volume_setting, 0);
		audio_play_sound(damSound, 6, false);
	}
}

function deltAlph(deltDamage, Fx, Fy, alpha) {
	if (obj_diver.flashAlpha <= 0) {
		global.player_health -= deltDamage;
		obj_diver.flashAlpha = alpha;
		obj_diver.attackedFromX = Fx;
		obj_diver.attackedFromY = Fy;
		obj_health_bar.alpha = 5;
		obj_health_bar.needToAnimateBreak = true;
		var damSound = (asset_get_index("sfx_damageTake" + string(irandom_range(0,2))));
		audio_sound_gain(damSound, global.volume_setting, 0);
		audio_play_sound(damSound, 6, false);
	}
}