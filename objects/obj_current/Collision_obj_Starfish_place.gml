with (obj_Starfish_place) { 
	if (place_meeting(x, y, obj_current)) {
		var speed_y = y - yprevious;
		if (!place_meeting(x+8,y,obj_collision_parent)) {
			x = x + 8;
		}
		if (y - obj_current.y > 5) {
			if (speed_y > 0) {
				y = y - speed_y;
			}
		}
	}
}

