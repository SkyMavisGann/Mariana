///@description pausing. audio pausing. opening inventory. changing room. map.
// if paused
if (text_counter >= 6.28) {
	text_counter = 0;
} else {
	text_counter += 0.01;
}
text_opacity = (sin(text_counter)/4)+0.25;
if ((gamepad_axis_value(0, gp_axislv) > 0.3) || gamepad_button_check(0, gp_face1)) {
	lastUsedGamePad = 10000;
}
if (lastUsedGamePad > 0) {
	lastUsedGamePad -= 1;
}
if (gamepad_is_connected(0) == 0 && isUsingGamePad) {
	PauseGame();
}
if (gamepad_is_connected(0) > 0 && lastUsedGamePad > 1) {
	isUsingGamePad = true;
} else {
	isUsingGamePad = false;
}


if ((keyboard_check_pressed(obj_settings.key_escape) || gamepad_button_check_pressed(0, gp_start)) && timer == 0) {
	if (global.paused == false && global.inventoried == true) {
		global.inventoried = false;
	} else {
		PauseGame();
	}
}
if (steam_is_overlay_activated() && steampauseOnce) {
	global.paused = true;
	saveSettings();
	timer = 5;
	steampauseOnce = false;
} else {
	steampauseOnce = true;
}

if (global.paused == true && run = 0 && !instance_exists(obj_pause_menu)) {
	instance_create_layer(0, 0, "menu_layer", obj_pause_menu);
}

if (global.paused == true) {
	run = 1;
	paused(true);
		audio_pause_sound(m_surface_tension);
		audio_pause_sound(m_aquifer);
		audio_pause_sound(m_with_baited_breath_start);
		audio_pause_sound(m_with_baited_breath_loop);
		audio_pause_sound(m_thorium);
}


	if (global.paused == false) {
		run = 0;
		paused(false);
		audio_resume_all()
	}

if timer >= 1 {timer -= 1}

//open inventory
if ((keyboard_check_pressed(obj_settings.key_inventory) || gamepad_button_check_pressed(0, gp_face4)) && global.paused == false) {
	global.inventoried = !global.inventoried;
}

if (global.inventoried == true) {
	instance_activate_object(obj_inventory);
	if healthOnce == false {
		instance_create_layer(0, 0, "menu_layer", obj_depth_meter);
		healthOnce = true;
	}
}

if (global.inventoried == false) {
	instance_deactivate_object(obj_inventory);
	global.inventory_menu = false;
	healthOnce = false;
	with (obj_depth_meter) {
		instance_destroy();
	}
}

if (global.inventory_menu == false && object_exists(obj_inventory_use)) {
	with (obj_inventory_use) {
		instance_destroy();
	}
	with (obj_item_desc) {
		instance_destroy();
	}
}



//change room ----------------

switch(global.next) { 

	case 0:
		array_set(global.doorInRoomMain, destination, [[], [x, y]]);
		saveGame(string(curLocation) + ".save");
		room_goto_next();
		loadGame(string(destination) + ".save", false);
		obj_settings.previousRoom = curLocation;
		
		global.next += 2;
		break;
	
	case 1:
		array_set(global.doorInRoomMain, room_previous(room), [[], [x, y]]);
		saveGame(string(curLocation) + ".save");
		room_goto_previous();
		loadGame(string(room_previous(room)) + ".save", false);
		obj_settings.previousRoom = curLocation;
		
		global.next += 2;
		break;
	}

// the full inventory script always to be running on at least one item
itemScript("game");

// map
if (string_copy(room_get_name(room), 0, 9) != "room_shop") {
	if (global.equipped[4] == "Ancient Map") {
		if ((keyboard_check_pressed(obj_settings.key_map) || gamepad_button_check_pressed(0, gp_face3)) && global.paused == false) {
			mapOpen = !mapOpen;
		}
	}
}

if (mapOpen == true && global.paused == false) {
	instance_activate_object(obj_map);
	if (global.paused == false && (centered == false)) {
	var scale_number = 11.256;
	if (room == Room1) {
		var x_pos = obj_diver.x - ((obj_diver.x +128)/ scale_number);
		var y_pos = obj_diver.y - ((obj_diver.y +16448)/ scale_number);
	} else if (room == Room2) {
		var x_pos = obj_diver.x - ((obj_diver.x +128)/ scale_number);
		var y_pos = obj_diver.y - ((obj_diver.y + 16448 + 15000)/ scale_number);
	} else {
		var x_pos = obj_diver.x - ((obj_diver.x +128 + global.doorInRoomMain[room][1][0])/ scale_number);
		var y_pos = obj_diver.y - ((obj_diver.y +16448 + global.doorInRoomMain[room][1][1])/ scale_number);
	}
	obj_map.x = x_pos;
	obj_map.y = y_pos;
	centered = true;
}
} 
if mapOpen == false {
	instance_deactivate_object(obj_map);
	centered = false;
}

var changeScaleTo = 0;
switch(room) {
	default:
		with (obj_diver) {
			changeScaleTo = distance_to_object(obj_collision_parent) / 250;
		}
	break;
	case Room1_Harpoon2:
		if (!global.paused) {
			if (obj_diver.x > 1600) {
			changeScaleTo = 1.5;
			} else {
				changeScaleTo = 1.2;
			}
		}
	break;
}
if (instance_exists(obj_diver_death)) {
	if (cameraScale < 1 && changeOnce) {
		cameraScale = 1;
		changeOnce = false;
	}
	changeScaleTo = 0.75;
	cameraScaleMinimum = 0.70;
	cameraScalingSpeed = 0.01;
}

scalingIntervalCheck++;
if (scalingIntervalCheck > 40) {
	with (obj_diver) {
		obj_game.prevValue = clamp(changeScaleTo, 1, 1.5);
	}
	scalingIntervalCheck = 0;
}


with (obj_diver) {
	if (debug == false) {
		if (obj_game.prevValue == clamp(changeScaleTo, 1, 1.5)) {
			if ( obj_game.scalingIntervalCheck == 29) {	
				obj_game.doScaling = true;
			}
		} else {
			obj_game.doScaling = false;
		}
	} else {
		obj_game.cameraScale = 20;
	}
	
}

scalingTimer++;
if (scalingTimer > 1) {scalingTimer = 0;}

if (doScaling == true) {
	
	with (obj_diver) {
		if (obj_game.cameraScale < changeScaleTo && obj_game.scalingTimer == 1) {
			obj_game.cameraScale += obj_game.cameraScalingSpeed;
		} else if (obj_game.cameraScale > changeScaleTo && obj_game.scalingTimer == 1) {
			obj_game.cameraScale -= obj_game.cameraScalingSpeed;
		}
		obj_game.distanceFromDiver = changeScaleTo;
	}
}


camera_set_view_border(view_camera[0], 1980, 1080);
camera_set_view_size(view_camera[0], 756 * clamp(cameraScale, cameraScaleMinimum, cameraScaleMaximum), 425 * clamp(cameraScale, cameraScaleMinimum, cameraScaleMaximum));


//give final heart
if (room == Room2_City1_Mural1 && instance_exists(obj_diver) && obj_diver.x < 1100) {
	if ((array_contains(obj_settings.achivements, "SuvivorMural")) == -1) {
		array_push(obj_settings.achivements, "SuvivorMural");
		if global.max_player_health < 10 {
			steam_set_achievement("ACHIEVEMENT_VIEW_MURAL");
			say(["Seeing the survivors mural. . .", "It strengthens your resolve."]);
			obj_health_bar.alpha = 5;
			obj_health_bar.needToAnimateBreak = true;
			obj_health_bar.frame = 0.9;
			obj_health_bar.curveSpeed = -0.05;
			global.max_player_health += 1;
			if (global.max_player_health == 10) {
				steam_set_achievement("ACHIEVEMENT_MAX_HEALTH");
			}
			audio_play_sound(sfx_Gain_Health, 1, false, global.volume_setting, 0, 1);
		}
	}
}
