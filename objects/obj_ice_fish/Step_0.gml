if distance_to_object(obj_diver) < 750 {
age++;
image_xscale = clamp(scale, 0.3, 1);
image_yscale = clamp(scale, 0.3, 1);
scale = age / 11000;

if (age > maxAge && age % 500 == 0) {
	HP = HP - 1;
}
dist_x = obj_diver.x - x;
dist_y = obj_diver.y - y;
// DOCILE BEHAVIOR
	if (obj_diver.attacked_recently >= 1) {

		// if right swim left
	if((dist_x < 400 && (dist_x > 0)) && (!place_meeting(x-swim_speed, y, obj_collision_parent)))
		{
		path_ended = "true";
	
	    x = x - (swim_speed);
		
	
		image_xscale = -1 * abs((image_xscale));
		}
	// if left swim right

	if ((dist_x > -400 &&  (dist_x < 0)) && (!place_meeting(x+swim_speed, y, obj_collision_parent)))
				{
					path_ended = "true";
 
	                  x = x + (swim_speed);
					 image_xscale = 1 * abs((image_xscale));
				} 

	//if below swim up
	if(((dist_y < 400 && (dist_y > 0)) && (!place_meeting(x, y-swim_speed, obj_collision_parent))) && (y > 0) )
		{
		path_ended = "true";
		
	    y = y - (swim_speed);
		
		} 
	// if above swim down
	if ((dist_y > -400 && (dist_y < 0)) && (!place_meeting(x, y+swim_speed, obj_collision_parent)))
		{
			path_ended = "true";	
	        y = y + (swim_speed);	
		} 
	}
	

if (age > 12000 && laidEggs = false) {
	var nearestSand = instance_nearest(x, y, obj_collision_parent);
	if (distance_to_object(nearestSand) > 5) {
		move_towards_point(nearestSand.x, nearestSand.y, swim_speed);
		layingEggsAge = age;
	} else {
		speed = 0;
		if (age - layingEggsAge > 500) {
			for (var i = 0; i < 3; i++;) {
				var guppy = instance_create_layer(x, y, "player_layer", obj_fish_egg);
				guppy.fish = object_get_name(object_index);
				guppy.hue = make_color_rgb(179, 200, 255);
				guppy.x = x + irandom_range(-5, 5);
				guppy.y = y + irandom_range(-2, 8);
			}
			laidEggs = true;
		}
	}
	

} else if (age % 2000 <= 3) {
	
	var seaweed = instance_nearest(x, y-20, obj_seaweed);
	var crab = instance_nearest(x, y, obj_flora_crab);
	if (!instance_exists(crab) || seaweed > crab) {
		if (distance_to_object(seaweed) > 20) {
			move_towards_point(seaweed.x, seaweed.y-20, swim_speed);
			path_ended = true;
		} else {
			path_ended = false;
			speed = 0;
		}
	} else {
		if (distance_to_object(crab) > 10) {
			move_towards_point(crab.x, crab.y, swim_speed);
			path_ended = true;
		} else {
			path_ended = false;
			speed = 0;
		}
	}
} else if (age % 2100 == 0) {
	speed = 0;
	path_ended = false;
	
} else {
	if (path_ended == false) {
		if (age % switchDirTime == 0) {
			direction = irandom_range(0, 360);
			speed = swim_speed;
			switchDirTime = irandom_range(100, 300);
		} else if (age % (switchDirTime + 100) == 0) {
			speed = 0;
		}
	}
}
//Resart pathing if far away
if (((abs(dist_x) >= 450 || abs(dist_y) >= 450)) && (path_ended == "true")) {

  path_ended = "false";
} else {
//reset pathing if haven't attacked in awhile
 if ((obj_diver.attacked_recently = 0) && (path_ended == "true")) {

  path_ended = "false";
 }
}
	if (InFrames >= 1) {
	 InFrames -= 1;
	}
	
	//DEATH -------------------------------------- Sprite input
	if (HP <= 0) {
		InFrames = 200; 
	    swim_speed = 0;
		sprite_index = spr_ice_fish_die;
	}


	if (flashAlpha > 0) {
		flashAlpha -= 0.05;
	}

	if (flashAlpha > 0.05) {
		var xway = x - obj_diver.x;
		var yway = y - obj_diver.y;
		if (!place_meeting(x + xway,y + yway, obj_collision_parent)) {
			move_towards_point(obj_diver.x, obj_diver.y, -3);	
		} else {
		speed = 0;
		}
	} else {
		if (flashAlpha = 0.05) {
	speed = 0;
		}
	}
}
