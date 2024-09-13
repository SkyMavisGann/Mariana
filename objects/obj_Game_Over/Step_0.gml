if (image_index >= image_number - 1) {
	image_speed = 0;
	lock = true;
}

if (lock) {
	image_index = image_number - 1;
}
x = view_get_wport(view_camera[0])/2;