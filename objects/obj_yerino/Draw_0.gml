draw_self()

if (flashAlpha > 0) {
	shader_set(shFlash);
	
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, flashColor, flashAlpha)
	
	shader_reset();
}

for (var i = 0; i < (maxHP - HP)/2; i++) {
	if ((i+1) % 2 == 0) {
		drawChildOf(spr_yerino_damage, i, 0, 0, abs(image_xscale), abs(image_yscale), 0, c_white, 1, obj_yerino_jaw);
	} else {
		//odd
		drawChildOf(spr_yerino_damage, i, 0, 0, abs(image_xscale), abs(image_yscale), 0, c_white, 1, obj_yerino_body);
	}
}