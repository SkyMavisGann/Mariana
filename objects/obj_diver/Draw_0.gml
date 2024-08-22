


if (!instance_exists(vfx_flying_object)) {
	if (global.equipped[1] == "Booster") {
		draw_sprite_ext(spr_Booster, 0, x, y-10, image_xscale *1.5,image_yscale * 1.5, 0, c_gray, 1);
	}
	if (global.equipped[3] == "Water Copter") {
		draw_sprite_ext(spr_Water_Copter, 0, x, y-40, image_xscale * 2.0,image_yscale * 2.0, 0, c_white, 1);
	}
}

draw_self();

if (!instance_exists(vfx_flying_object)) {
	draw_sprite_ext(spr_hurt1, clamp(global.max_player_health - global.player_health, 0, global.max_player_health-1), x, y, image_xscale, image_yscale, image_angle, c_white, 1);
	if (global.equipped[7] == "Pirate Hat") {
		drawChildOf(spr_Pirate_Hat, 0, 0, 0, 1, 1, 0, c_white, 1, obj_diver_head);
	}
	
	if (array_length(global.equipped) < 3) {
		array_push(global.equipped, 0.0);
	}

	draw_sprite_ext(convertTo(sprite_get_name(sprite_index), global.equipped[0]), image_index, x, y, image_xscale ,image_yscale, 0, c_white, 1);

	if (global.equipped[2] == "Luciferin") {
		draw_sprite_ext(spr_Luciferin_Belt, 0, x, y, image_xscale, image_yscale, image_angle, c_white, 1);
	}
	if (global.equipped[5] == "Depthometer") {
		drawChildOf(spr_Depthometer_Helm, 0, 4, 6, 1.5, 1.5, 0, c_white, 1, obj_diver_right_arm);
	}
	if (global.equipped[6] == "Healthometer") {
		drawChildOf(spr_Healthometer_Helm, 0, 5, 6, 1.5, 1.5, 0, c_white, 1, obj_diver_left_arm);
	}
	
}

if (array_contains(obj_settings.achivements, "Gunked")) {
	if (bossRewardAnimationFrame > 12) {
		bossRewardAnimationFrame = 6;
	}
	switch (sprite_index) {
		case spr_swimming:
			draw_sprite_ext(spr_gain_gills_swim, bossRewardAnimationFrame, x, y, image_xscale, image_yscale, 0, c_white, 1);
		break;
		case spr_divr_attacking_side:
			draw_sprite_ext(spr_gain_gills_side, bossRewardAnimationFrame, x, y, image_xscale, image_yscale, 0, c_white, 1);
		break;
		default:
			draw_sprite_ext(spr_gain_gills, bossRewardAnimationFrame, x, y, image_xscale, image_yscale, 0, c_white, 1);
		break;
	}
	
	if (bossRewardAnimationFrame == 5 && bossRewardAnimationFrameTimer == 0) {
		for (var i = 0; i < 4; i++) {
			var zero = instance_create_layer(x, y, "in_front_of_player", vfx_helm_burst);
			zero.image_xscale = image_xscale;
			zero.image_yscale = image_yscale;
			zero.image_index = i;
			zero.direction = 175 * i;
			zero.speed = 3;
		}
	}
	bossRewardAnimationFrameTimer++;
	if (bossRewardAnimationFrameTimer >= 16) {
		bossRewardAnimationFrame++;
		bossRewardAnimationFrameTimer = 0;
	}
}


if (flashAlpha > 0) {
	shader_set(shFlash);
	
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, flashColor, flashAlpha);
	
	shader_reset();
}


