// Script assets have changed for v2.3.0 see
// To be put in step event
function itemScript(itemName){
	draw_set_font(spr_font_fundant);
	if (array_length(global.inventory) < 1 && instance_exists(obj_diver)) { 
		obj_diver.inventory_full = false;
	}

	if (!global.paused) {
		image_angle += 2;
		x += (randDir/3);
		y += (randDir2/3);

		//despawn -= 1;

		//if despawn == 0 {
		//	instance_destroy();
		//}
	}

	while_counter = 0;

	//pickup

	// horizontal moving collide
	if (place_meeting(x+randDir,y,obj_collision_parent)) {
	while ((!place_meeting(x+sign(randDir),y,obj_collision_parent)) && (while_counter < 50)) {
	  x = x + sign(randDir);
	  while_counter = while_counter + 1;
	   }
	 randDir = 0;
	}
	// vertical moving collide
	if (place_meeting(x,y+randDir2,obj_collision_parent)) {
	while ((!place_meeting(x,y+sign(randDir2),obj_collision_parent)) && (while_counter < 50)) {
	  y = y + sign(randDir);
	  while_counter = while_counter + 1;
	   }
	 randDir2 = 0;
	}
	
	var full_length;
	//if diver exists give him item and delete self
	if instance_exists(obj_diver) {
		if ((place_meeting(x,y,obj_diver) && (obj_settings.Automatic_pickup == true || pickupability == true)) || itemName == "game") {
			//can move JUST THIS FOR LOOP into obj game but i jus don't feel like it cause it works rn
						for (var i = 0; i < array_length(global.inventory) + 1; i++) {
						  if i <= 0 {
							  //draw line 1
								  full_length = 0;
								  
								  if (string_width(itemName) > 960) {
								  show_debug_message("String width: " + string(full_length));
								  obj_diver.inventory_full = true;
								  showName = true;
								  } else {
									obj_diver.inventory_full = false;
									showName = false;
								  }
								  
							  } else {
								  //draw other lines
								  if (full_length + string_width(global.inventory[i - 1]) + string_width(itemName) > 960) {
								  show_debug_message("String width: " + string(full_length + string_width(global.inventory[i - 1])));
								  obj_diver.inventory_full = true;
								  showName = true;
								  } else {
									obj_diver.inventory_full = false;
									showName = false;
								  }
									full_length += (20 + string_width(global.inventory[i-1]));
									// casopiea edgecase
									//if inventory goes over (plan b) send an item out
									if (itemName == "game") {
									if (full_length + string_width(global.inventory[i - 1]) > 1470 && (obj_diver.inventory_full == true)) {
									}
								}
							}
					
						}
			if ((itemName != "game")) {
				if (obj_diver.inventory_full == false) {
					instance_destroy();
					addItem(itemName);
				}
			}
		}
	}
}
