if (array_contains(obj_settings.achivements, "Lunked") != -1 && instance_exists(obj_diver)) {

	// check if you are the last tentacle
	if (myNumber == (array_length(allTentaclesAbove) - 1)) {
		sprite_index = noone;
	}

	if (sprite_index != spr_stem_end) {
		if (myNumber == (array_length(allTentaclesAbove) - 2)) {
			sprite_index = spr_stem_end;
		}
	}
	// calculate position based on angle and length and angle of previous tentacle
	if (myNumber == 0) {
		var upperTent = obj_Siph_Tentacle;
		if (instance_exists(upperTent)) {
			var goalx = upperTent.x + (dsin(upperTent.image_angle + 90));
			var goaly = upperTent.y + (dcos(upperTent.image_angle + 90));
			x = goalx;
			y = goaly;
		}
	}
	if (myNumber == array_length(obj_Siph_Tentacle.stemBody) - 1) {
		var lowerTent = obj_Siph_Tentacle.stemBody[myNumber - 1];
		if (instance_exists(lowerTent)) {
			if (keyboard_or_mouse_check_pressed(mb_right)) {
			obj_siph_seg_player.IEx = mouse_x - obj_Siph_Tentacle.x;
			obj_siph_seg_player.IEy = mouse_y - obj_Siph_Tentacle.y;
			obj_diver.attacking = 1;
			}
			if (obj_siph_seg_player.IEx != 0 && obj_siph_seg_player.IEy != 0) {
				obj_diver.attacking = 1;
				if (abs(x - (obj_Siph_Tentacle.x + obj_siph_seg_player.IEx)) < 5 && abs(y - (obj_Siph_Tentacle.y + obj_siph_seg_player.IEy)) < 5) {
					obj_siph_seg_player.IEx = 0;
					obj_siph_seg_player.IEy = 0;
					obj_diver.attacking = 0;
				}
			
			}
				move_towards_point(obj_Siph_Tentacle.x + obj_siph_seg_player.IEx, obj_Siph_Tentacle.y + obj_siph_seg_player.IEy, obj_Siph_Tentacle.swim_speed);
		}
	}
}
