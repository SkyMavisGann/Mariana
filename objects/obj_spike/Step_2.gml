if (instance_exists(obj_diver)) {
	var speed_x = obj_diver.x - obj_diver.xprevious;
	var speed_y = obj_diver.y - obj_diver.yprevious;

	var spe = sqrt(sqr(speed_x) + sqr(speed_y));



	if (place_meeting(x - speed_x, y - speed_y, obj_diver)) {
		if (spe > crash_speed) {
			deltAlph(damage, x, y, 1);
		}
	}
}
