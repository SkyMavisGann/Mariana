/// @description player collide
var angleBetween = 90;
var hypot = sqrt(sqr(cx) + sqr(cy));
var TentacleX = ((hypot * 1) * dsin(angleBetween + image_angle));
var TentacleY = ((hypot * 1) * dcos(angleBetween + image_angle));
var xChange = TentacleX * 1;
var yChange = TentacleY * 1;
var xChanged = xChange / max(abs(xChange), abs(yChange)) * pushSpeed;
var yChanged = yChange / max(abs(xChange), abs(yChange)) * pushSpeed;


with (obj_diver) { 
	if (!place_meeting(x+xChanged,y+yChanged,obj_collision_parent)) {
		x += xChanged;
		y += yChanged;	
		if (!audio_is_playing(sfx_current)) {
			audio_sound_gain(sfx_current, 0, 0);
			audio_sound_gain(sfx_current, global.volume_setting, 500);
			audio_play_sound(sfx_current, 1, true);
		}
		
	}
}

if (block && underneathLine()) {
	if (instance_exists(obj_diver) && obj_diver.swim_speed < 10) {
		obj_diver.y = obj_diver.y - ((obj_diver.vsp + 0.1));
		obj_diver.x = obj_diver.x - ((obj_diver.hsp + 0.1));
	}
}

