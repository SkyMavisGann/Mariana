
if (instance_exists(obj_diver) && distance_to_object(obj_diver) < 6000) {
	
	var starfish = instance_nearest(x,y, obj_Starfish_place);
	if (abs(y - obj_diver.y) < abs(y - starfish.y)) {
		EEx = obj_diver.x;
	} else {
		EEx = starfish.x;
	}
	EEy = 1777;
	if (distance_to_object(obj_diver) < 150 && !HideOnce) {
		alarm[0] = 300;
		HideOnce = true;
	}
	var seconds = current_time / 10000;
	if (seconds < HideTime + 1.5) {
		EEx = clamp(x + (sign(HideDirection) * 100), obj_diver.x - 5300, obj_diver.x + 5300);
	}
	var pd = point_direction(x, y, EEx, EEy);
	var dd = angle_difference(image_angle,180 + pd);
	image_angle -= min(abs(dd), rotation_speed) * sign(dd);
	direction = image_angle;
	speed = -swim_speed;
	
		for (var i = 1; i < array_length(stemBody); ++i) {
			with (stemBody[i]) {
				var upperTent = allTentaclesAbove[myNumber - 1]; 

				var pd = point_direction(upperTent.x, upperTent.y, x, y);
				var dd = angle_difference(upperTent.image_angle,pd);
				
				upperTent.image_angle -= min(abs(dd), 10) * sign(dd);
				
				var goalx = upperTent.x + (length * dsin(upperTent.image_angle + 90));
				var goaly = upperTent.y + (length * dcos(upperTent.image_angle + 90));
				x = goalx;
				y = goaly;
				
			}
		}

} else {
	speed = 0;
}
collision();
