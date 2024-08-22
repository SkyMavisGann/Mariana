//move to next room
if (instance_exists(obj_diver)) {
	if (obj_settings.previousRoom == destination && ((obj_diver.y < 2) || obj_diver.y > room_height - 2)) {
		array_set(global.doorInRoomMain, room, [find_room_path(room), [0, 0]]);
		obj_settings.previousRoom = curLocation;
	}
}
if (room == Room2) {
	array_set(global.doorInRoomMain, room, [find_room_path(room), [0, 15000]]);
} else if (room == Room1) {
	array_set(global.doorInRoomMain, room, [find_room_path(room), [0, 0]]);
}
switch(global.next) { 

	case 2:
		obj_diver.x = global.previous_x
		audio_sound_gain(m_surface_tension, 0, 5000)
		audio_sound_gain(m_with_baited_breath_loop, 0, 5000);
		audio_sound_gain(m_with_baited_breath_start, 0, 5000);
		
		
		obj_sounds.musicTimer = 240;
		global.next = -1;
		break;
	
	case 3:
		show_debug_message(global.previous_x)
		obj_diver.x = global.previous_x
		obj_diver.y = room_height;
		audio_sound_gain(m_aquifer, 0, 5000)
		
		obj_sounds.musicTimer = 240;
		global.next = -1;
		break;
	}


if ((audio_sound_get_gain(m_surface_tension) <= 0) && (obj_sounds.musicTimer <= -120)) {
	if global.volume_setting != 0 {
audio_stop_sound(m_surface_tension);
	}
}

if ((audio_sound_get_gain(m_aquifer) <= 0) && (obj_sounds.musicTimer <= -120)) {
	if global.volume_setting != 0 {
audio_stop_sound(m_aquifer);
	}
}