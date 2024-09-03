  
// You can write your code in this editor
var speed_x = x - xprevious;
var speed_y = y - yprevious;
if (sprite_index != spr_crabioli_without_arm_jump) {
	if (speed != 0) {
		sprite_index = spr_crabioli_without_arm_walk;
	} else {
		sprite_index = spr_crabioli_without_arm;
	}
}


// Get the Y speed of the fish by subtracting the current Y position
// from the previous Y position


// This condition checks if the fish is moving right
if(speed_x >= 1)
{
	// In that case we reset the horizontal scale
	if (!global.paused) {
		if (!place_meeting(x-300,obj_diver.y,obj_diver) && !place_meeting(x-100,obj_diver.y,obj_diver)) {
		image_xscale = -scale;
		}
	}
}

// If fish is moving left
if(speed_x <= -1)
{
	// Set horizontal scale to -1 to flip it
	image_xscale = scale;

}

if(speed_y <= -1)
{
	// Set horizontal scale to -1 to flip it

}

if(speed_y <= 1)
{
	// Set horizontal scale to -1 to flip it
	
}

if (place_meeting(x+swim_speed, y, obj_collision_parent) || (place_meeting(x-swim_speed, y, obj_collision_parent)))
{
    path_end(); 
if ((place_meeting(x-swim_speed, y, obj_collision_parent))) {
 x = x + swim_speed
}
if ((place_meeting(x+swim_speed, y, obj_collision_parent))) {
 x = x - swim_speed;
}
	 
}
if (place_meeting(x, y+swim_speed, obj_collision_parent) || (place_meeting(x, y-swim_speed, obj_collision_parent)))
{
    
	if (place_meeting(x, y+swim_speed, obj_collision_parent))
	{
		y = y - swim_speed;
	}
	if ((place_meeting(x, y-swim_speed, obj_collision_parent))) {
		
	}
	 
	
}
