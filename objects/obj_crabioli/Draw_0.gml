draw_sprite_ext(spr_crabioli_seaweed, clamp(subimg, 0, 5), x, y, image_xscale, image_yscale, 0, c_white, 1);
draw_self();
if (sprite_index == spr_crabioli_without_arm_jump && (image_index < 8)) {
	draw_sprite_ext(armSprite, 0, x, y +10, image_xscale, image_yscale, rightArmRotation, c_white, 1);
	draw_sprite_ext(spr_crabioli_left_arm, 0, x, y+10, image_xscale, image_yscale, leftArmRotation, c_white, 1);
} else {
	draw_sprite_ext(armSprite, 0, x, y, image_xscale, image_yscale, rightArmRotation, c_white, 1);
	draw_sprite_ext(spr_crabioli_left_arm, 0, x, y, image_xscale, image_yscale, leftArmRotation, c_white, 1);
}


if (flashAlpha > 0) {
	shader_set(shFlash);
	
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, flashColor, flashAlpha)
	
	shader_reset();
}