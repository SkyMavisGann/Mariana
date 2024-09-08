// get input
key_w = (keyboard_check_pressed(obj_settings.key_up) || (gamepad_button_check_pressed(0, gp_padu)) || global.joystickPressVertical <= -0.8);
key_s = (keyboard_check_pressed(obj_settings.key_down) || (gamepad_button_check_pressed(0, gp_padd)) || global.joystickPressVertical >= 0.8);
key_accept = keyboard_check_pressed(obj_settings.key_select) || gamepad_button_check_pressed(0, gp_face1);
