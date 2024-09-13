if flipInterval > 1 {flipInterval--;}
// You can write your code in this editor
var speed_x = x - xprevious;

// Get the Y speed of the fish by subtracting the current Y position
// from the previous Y position


// This condition checks if the fish is moving right
if flashAlpha = 0 {
	if(speed_x > 0 && (flipInterval <= 1))	{
		// In that case we reset the horizontal scale
		if (!place_meeting(x,y,obj_diver)) {
			image_xscale = scale;
			flipInterval = 15;
		}
		direction = 180;


	}

	// If fish is moving left
	if(speed_x < 0 && (flipInterval <= 1))	{
		// Set horizontal scale to -1 to flip it
		image_xscale = -scale;
		flipInterval = 15;
	}
}
if (place_meeting(x, y+10, obj_collision_parent) || (place_meeting(x, y-10, obj_collision_parent))) {
	speed = 10;
}


//create limbs
if (!instance_exists(obj_yerino_body)) {
	instance_create_depth(x, y, depth-1, obj_yerino_body);
	instance_create_depth(x, y, depth-1, obj_yerino_jaw);

}
