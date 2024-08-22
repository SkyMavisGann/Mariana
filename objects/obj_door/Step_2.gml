/// @description when leaving
if (obj_settings.previousRoom == destination && obj_settings.code == code) {
	obj_diver.x = destinX;
	obj_diver.y = destinY;
	if (room == Room1) {
		array_set(global.doorInRoomMain, room, [find_room_path(room), [0, 0]]);
	} else if (room == Room2) {
		array_set(global.doorInRoomMain, room, [find_room_path(room), [0, 15000]]);
	} else {
		array_set(global.doorInRoomMain, room, [find_room_path(room), 
		[global.doorInRoomMain[room][1][0] - x, global.doorInRoomMain[room][1][1] - y]]);
	}
	obj_settings.previousRoom = curLocation;
}