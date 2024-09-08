
if (instance_exists(obj_diver)) {
	if (global.paused != true) {
		var _c = c_aqua;
		if ((array_contains(obj_settings.achivements, "Moved")) == -1) {
			if (!obj_game.isUsingGamePad) {
				draw_text_color(obj_diver.xprevious+50, obj_diver.yprevious-50, global._fhinputKeys[obj_settings.key_up], _c, _c, _c, _c, text_opacity);
				draw_text_color(obj_diver.xprevious+50-string_width(global._fhinputKeys[obj_settings.key_up] + " "), obj_diver.yprevious-35, global._fhinputKeys[obj_settings.key_left] +
				" " + global._fhinputKeys[obj_settings.key_down] + 
				" " + global._fhinputKeys[obj_settings.key_right] , _c, _c, _c, _c, text_opacity);
		
				if (keyboard_or_mouse_check_pressed(obj_settings.key_right)) {
					array_push(obj_settings.achivements, "Moved");
				}
			} else {
				draw_text_color(obj_diver.xprevious+50, obj_diver.yprevious-50, "Left JoyStick", _c, _c, _c, _c, text_opacity);
				if ((gamepad_axis_value(0, gp_axislv) > 0.3)) {
					array_push(obj_settings.achivements, "Moved");
				}
			}
		}
		if ((array_contains(obj_settings.achivements, "Chested")) == -1) {
				with (obj_diver) {
					if (distance_to_object(obj_chest) < 20) {
						if (!obj_game.isUsingGamePad) {
							draw_text_color(obj_diver.xprevious+50, obj_diver.yprevious-25, global._fhinputKeys[obj_settings.key_select], _c, _c, _c, _c, obj_game.text_opacity);
							if (keyboard_or_mouse_check_pressed(obj_settings.key_select)) {
								array_push(obj_settings.achivements, "Chested");
							}
						} else {
							draw_text_color(obj_diver.xprevious+50, obj_diver.yprevious-25, "A", _c, _c, _c, _c, obj_game.text_opacity);
							if (gamepad_button_check_pressed(0, gp_face1)) {
								array_push(obj_settings.achivements, "Chested");
							}
						}
					}
				}
			}
			if ((array_contains(obj_settings.achivements, "SubShopped")) == -1) {
					with (obj_diver) {
					if (distance_to_object(obj_sub_shop) < 15) {
						if (!obj_game.isUsingGamePad) {
							draw_text_color(obj_diver.xprevious+50, obj_diver.yprevious-25, global._fhinputKeys[obj_settings.key_select], _c, _c, _c, _c, obj_game.text_opacity);
						} else {
							draw_text_color(obj_diver.xprevious+50, obj_diver.yprevious-25, "A", _c, _c, _c, _c, obj_game.text_opacity);
						}
					}
				}
			}
			with (obj_diver) {
				if (distance_to_object(obj_Interactable_Parent) < 15) {
					if (!obj_game.isUsingGamePad) {
						draw_text_color(obj_diver.xprevious+50, obj_diver.yprevious-25, global._fhinputKeys[obj_settings.key_select], _c, _c, _c, _c, obj_game.text_opacity);
					} else {
						draw_text_color(obj_diver.xprevious+50, obj_diver.yprevious-25, "A", _c, _c, _c, _c, obj_game.text_opacity);
					}
				}
					
			}
			if ((array_contains(obj_settings.achivements, "Attacked")) == -1) {
				with (obj_diver) {
					if (distance_to_object(obj_docile_behavior_parent) < 15) {
						if (!obj_game.isUsingGamePad) {
							draw_text_color(obj_diver.xprevious+60, obj_diver.yprevious-45, global._fhinputKeys[obj_settings.key_attack], _c, _c, _c, _c, obj_game.text_opacity);
							if (keyboard_or_mouse_check_pressed(obj_settings.key_attack)) {
								array_push(obj_settings.achivements, "Attacked");
							}
						} else {
							draw_text_color(obj_diver.xprevious+50, obj_diver.yprevious-25, "Right Bumper", _c, _c, _c, _c, obj_game.text_opacity);
							if (gamepad_button_check_pressed(0, gp_shoulderrb)) {
								array_push(obj_settings.achivements, "Attacked");
							}
						}
					}
				}
			}
			if ((array_contains(obj_settings.achivements, "Opened")) == -1) {
				if (array_length(global.inventory) > 2) {
					if (!obj_game.isUsingGamePad) {
						draw_text_color(obj_diver.xprevious+50, obj_diver.yprevious-5, global._fhinputKeys[obj_settings.key_inventory], _c, _c, _c, _c, obj_game.text_opacity);
						if (keyboard_or_mouse_check_pressed(obj_settings.key_inventory)) {
							array_push(obj_settings.achivements, "Opened");
						}
					} else {
						draw_text_color(obj_diver.xprevious+50, obj_diver.yprevious-25, "Y", _c, _c, _c, _c, obj_game.text_opacity);
						if (gamepad_button_check_pressed(0, gp_face1)) {
							array_push(obj_settings.achivements, "Opened");
						}
					}
				}
			}
			if ((array_contains(obj_settings.achivements, "LeftSub")) == -1) {
				if (room == room_shop_top) {
					draw_text_color(50, 5, global._fhinputKeys[obj_settings.key_escape] + " To Leave", _c, _c, _c, _c, obj_game.text_opacity);
				}
			}
			if ((array_contains(obj_settings.achivements, "Boost")) == -1) {
				if (global.equipped[1] == "Booster") {
					if (!obj_game.isUsingGamePad) {
					draw_text_color(obj_diver.xprevious+60, obj_diver.y-20, global._fhinputKeys[obj_settings.key_dash], _c, _c, _c, _c, obj_game.text_opacity);
					if (keyboard_or_mouse_check_pressed(obj_settings.key_dash)) {
						array_push(obj_settings.achivements, "Boost");
					}
					} else {
						draw_text_color(obj_diver.xprevious+50, obj_diver.yprevious-25, "Left Bumper", _c, _c, _c, _c, obj_game.text_opacity);
						if (gamepad_button_check_pressed(0, gp_shoulderlb)) {
							array_push(obj_settings.achivements, "Boost");
						}
					}
				}
			}
	}
}