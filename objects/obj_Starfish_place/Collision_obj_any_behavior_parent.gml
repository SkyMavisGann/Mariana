if (object_exists(obj_diver)) {
	move_towards_point(obj_diver.x, obj_diver.y, (obj_diver.swim_speed + 3) / 6);
	if (((x - obj_diver.x) > 5) || (x - obj_diver.x) < -5 || ((y - obj_diver.y) > 5) || ((y - obj_diver.y) < -5)) {
		image_angle = image_angle + random_range(-10, 10);
	}
}
	