if (global.hoziCanChange) {
	global.joystickPressHorizontal = gamepad_axis_value(0, gp_axislh);
	global.hoziCanChange = false;
}

if (global.vertCanChange) {
	global.joystickPressVertical = gamepad_axis_value(0, gp_axislv);
	global.vertCanChange = false;
}
if (room == roomStartScreen && !instance_exists(obj_start_menu)) {
	instance_create_layer(500, 500, "Instances", obj_start_menu);
}