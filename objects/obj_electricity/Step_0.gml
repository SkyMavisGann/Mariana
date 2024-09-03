speed = 7;

if ((place_meeting(x, y, obj_collision_parent))) {
	audio_stop_sound(sfx_zap);
	audio_play_sound_on(audio_emitter, sfx_zapEnd, false, 1, global.volume_setting);
	instance_destroy();
}

if (!global.paused) {
	despawn -= 1;
	if despawn == 0 {
		instance_destroy();
	}
}

//jitter

var randX = irandom_range(-6, 6);
var randY = irandom_range(-6, 6);

var choice = irandom_range(0, 2);
if (choice == 1) {
	x = x + randX;
	image_xscale = image_xscale + 0.1;

} else if (choice == 2) {
	y = y + randY;
	image_yscale = image_yscale + 0.1;
}
audio_emitter_position(audio_emitter, x, y, 0);