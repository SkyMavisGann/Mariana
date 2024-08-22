if (image_index >= image_number - 1) {
	image_speed = 0;
	lock = true;
}

if (lock) {
	image_index = image_number - 1;
}
x = window_get_width()/2 - (sprite_get_width(sprite_index) * image_xscale)/2;