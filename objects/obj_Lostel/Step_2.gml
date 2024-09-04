if (sprite_index != spr_Lostal_Attack) {
	if (speed != 0) {
		sprite_index = spr_Lostal_Walk;
	} else {
		sprite_index = spr_Lostal;
	}
}
	var speed_x = x - xprevious;

	// This condition checks if the fish is moving right
	if(speed_x >= 0.1)
	{
		// In that case we reset the horizontal scale
		if (!place_meeting(x,y,obj_diver)) {
		image_xscale = 1 * abs((image_xscale));
		}
	}
	// If fish is moving left
	if(speed_x <= -0.1)
	{
		// Set horizontal scale to -1 to flip it
		image_xscale = -1 * abs((image_xscale));
	}
	
if (place_meeting(x+swim_speed, y, obj_collision_parent) || (place_meeting(x-swim_speed, y, obj_collision_parent)))
{
	if ((place_meeting(x-swim_speed, y, obj_collision_parent))) {
		x = x + swim_speed
		needsToMoveLeftRight = 0;
	}
	if ((place_meeting(x+swim_speed, y, obj_collision_parent))) {
		x = x - swim_speed;
		needsToMoveLeftRight = 1;
	}
	 
}
if (place_meeting(x, y, obj_collision_parent))
{
	y = y - swim_speed;
}

if ((!place_meeting(x+25, y+2, obj_collision_parent)) || (!place_meeting(x-25, y+2, obj_collision_parent))) {
	if (!place_meeting(x+25, y+2, obj_collision_parent)) {
		speed = 0;
		needsToMoveLeftRight = 0;
	}
	if (!place_meeting(x-25, y+2, obj_collision_parent)) {
		speed = 0;	
		needsToMoveLeftRight = 1;
	}
} else {
	needsToMoveLeftRight = -1;
}