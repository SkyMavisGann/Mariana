draw_self();
if (text_counter >= 6.28) {
	text_counter = 0;
} else {
	text_counter += 0.01;
}
text_opacity = (sin(text_counter)/4)+0.25;
var scale_number = 11.256;
	
var x_pos = x + ((obj_diver.x +128 + global.doorInRoomMain[room][1][0])/ scale_number);
var y_pos = y + ((obj_diver.y +16448 + global.doorInRoomMain[room][1][1])/ scale_number);
draw_sprite_ext(spr_death_icon, 1, x_pos, y_pos, 1, 1, 0, c_aqua, text_opacity);
for (var i = 0; i < array_length(global.roomsWithCorpses); i++) {
	if (global.roomsWithCorpses[i] == room) {
		if (instance_exists(obj_dead_diver)) {
			with (obj_dead_diver) {
				var x_pos_cor = obj_map.x + ((x +128 + global.doorInRoomMain[room][1][0])/ scale_number);
				var y_pos_cor = obj_map.y + ((y +16448 + global.doorInRoomMain[room][1][1])/ scale_number);
				draw_sprite_ext(spr_death_icon, 0, x_pos_cor, y_pos_cor, 1, 1, 0, c_aqua, obj_map.text_opacity);
			}
		}
	} else {
		with (obj_door) {
			
			var path = path_to_room_from(room, global.roomsWithCorpses[i]);
			//if the room you're in has a higher index then the destination room does then glow
			if (array_contains(path, room) != -1 && array_contains(path, destination) != -1) {
				if (array_contains(path, room) < array_contains(path, destination)) {
					if (instance_exists(obj_map)) {
						var x_pos_cor = obj_map.x + ((x +128 + global.doorInRoomMain[room][1][0])/ scale_number);
						var y_pos_cor = obj_map.y + ((y +16448 + global.doorInRoomMain[room][1][1])/ scale_number);
						draw_sprite_ext(spr_death_icon, 0, x_pos_cor, y_pos_cor, 1, 1, 0, c_aqua, obj_map.text_opacity);
					}
				}
			}
		}
	}
}