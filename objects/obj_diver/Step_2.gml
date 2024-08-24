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