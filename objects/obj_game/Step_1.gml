if instance_exists(obj_diver) {
	// if in room one go to room two
	if obj_diver.y > room_height {
		global.previous_x = obj_diver.x;
		global.next = 0;
		global.playerSpeX = obj_diver.speX;
		global.playerSpeY = obj_diver.speY;
	}
	

	//if in room two go to room 1
	if (room != Room1) {
		if obj_diver.y < 0 {
			global.previous_x = obj_diver.x;
			global.next = 1;
		}
	}

}