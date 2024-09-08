if (abs(gamepad_axis_value(0, gp_axislh)) >= 0.8) {
	global.joystickPressHorizontal = 0;
} else {
	global.hoziCanChange = true;
}
if (abs(gamepad_axis_value(0, gp_axislv)) >= 0.8) {
	global.joystickPressVertical = 0;
} else {
	global.vertCanChange = true;
}
