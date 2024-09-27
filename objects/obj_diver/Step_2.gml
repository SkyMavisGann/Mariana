if (y != yprevious) {
	global.oceanDepth += sign(y - yprevious);
}


//create limbs
if (!instance_exists(obj_diver_body)) {
	instance_create_layer(x, y, "in_front_of_player", obj_diver_body);
	instance_create_layer(x, y, "in_front_of_player", obj_diver_head);
	instance_create_layer(x, y, "in_front_of_player", obj_diver_left_arm);
	instance_create_layer(x, y, "in_front_of_player", obj_diver_right_arm);
}

if (array_contains(obj_settings.achivements, "Lunked") != -1 && !instance_exists(obj_Siph_Tentacle)) {
	instance_create_layer(x, y, "behind_diver", obj_Siph_Tentacle);
}


//Fallback if stuck in wall somehow

if (collectingPrevious) {
	prevX = xprevious;
	prevY = yprevious
	prevRoom = room;
}
if (place_meeting(x, y, obj_collision_parent) && room == prevRoom) {
	collectingPrevious = false;
	var changeByX = x - prevX;
	var changeByY = y - prevY;
	if (variable_instance_exists(id, "prevX") && 
	(changeByX > -swim_speed * 5 && changeByX < swim_speed * 5) &&
	(changeByY > -swim_speed * 5 && changeByY < swim_speed * 5)) {
		x -= changeByX
		y -= changeByY
	}
} else {
	collectingPrevious = true;
}