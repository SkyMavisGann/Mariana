if (global.hoziCanChange) {
	global.joystickPressHorizontal = gamepad_axis_value(0, gp_axislh);
	global.hoziCanChange = false;
}

if (global.vertCanChange) {
	global.joystickPressVertical = gamepad_axis_value(0, gp_axislv);
	global.vertCanChange = false;
}