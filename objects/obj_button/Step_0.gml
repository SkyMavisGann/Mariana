if (!instance_exists(obj)) {
	instance_destroy();
} else if (menu_level != obj.menu_level) {
	obj.buttons = [];
	obj.summonButtonsOnce = true;
	with (obj_button) {
		instance_destroy();
	}
}

if (position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), id)) {
	hovering = true;
 if (mouse_check_button_pressed(mb_left)) {
	pressed = true;
	if (global.paused == false) {
		alarm[0] = 1;
	} else {
		alarm[0] = 2;
	}
 }
} else {
	hovering = false;
}
