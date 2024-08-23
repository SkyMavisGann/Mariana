// get input
key_w = keyboard_check_pressed(obj_settings.key_up);
key_s = keyboard_check_pressed(obj_settings.key_down);
key_accept = keyboard_check_pressed(obj_settings.key_select);

//storen number of otpions
op_length = array_length(option[menu_level]);


// enable clicking
for(var i = 0; i < array_length(buttons); i++) {
	var object = buttons[i];
	if (object.pressed == true) {
		pos = object.index;
		key_accept = true;
		buttons = [];
		obj_inventory.buttons = [];
		instance_destroy(obj_button);
	}
}
//move through menu
pos += key_s - key_w;
if pos >= op_length {pos = 0};
if pos < 0 {pos = op_length -1};

//using menu
if (key_accept) {
	buttons = [];
	obj_inventory.buttons = [];
	instance_destroy(obj_button);
audio_play_sound(sfx_select, 2, false);
	var _sml = menu_level;
		
	switch (menu_level) {
	
		//pause menu
		case 0:
			switch(pos) {
			//Use
			case 0:
			// ITEMS USES ----------------------------------------------------------------------------
				if (array_length(global.inventory) > 0) {
								switch(global.inventory[obj_inventory.pos]) {
							//if its an oxygen tank
							case "Air Tank":
								prev_ox = global.oxygen; 
								
								array_delete(global.inventory, obj_inventory.pos, 1)
								instance_create_layer(obj_diver.x, obj_diver.y+20, "behind_diver", oxygen_tank)
								obj_oxygen_indicator.refilling = 1;
							break;
							//secial item        
						    case "Ice": 
								obj_diver.StaredAtWater++;
								switch (obj_diver.StaredAtWater) 
								{
									case 2:
										say(["You stare at the ice willing it to melt.", "It didn't work but if you stare more maybe it will."]);
									break;
									case 3:
										say(["You stare at the ice willing it to melt!", "It works!"]);
										array_delete(global.inventory, obj_inventory.pos, 1);
										buyItem("Water");
										obj_diver.StaredAtWater = 0;
									break;
									default:
										say(["You cannot use this item.", "Also you probably shouldn't keep ice in your pockets for too long"]);
									break;
								}	
								
								
								if (!array_contains(obj_settings.achivements, "Read ice")) {
									array_push(obj_settings.achivements, "Read ice");
								}
							break;
							case "Water":
								if (array_contains(obj_settings.achivements, "Read ice")) {
									say(["Hey don't look at me, I warned you."]);
								} else {
									say(["Somehow this ice became water."]);
								}
							break;
						    //end game
						    case "game": array_delete(global.inventory, obj_inventory.pos, 1);
								game_end(); 
							break;
							case "Soggy Sandwich":
							instance_destroy();
							if global.player_health < global.max_player_health {
								global.player_health += 1;
							}
								 array_delete(global.inventory, obj_inventory.pos, 1) 
							break;
							case "Fish Soul":
								instance_destroy();
								if global.max_player_health < 8 {
									say(["You're filled with resolve."]);
									global.max_player_health += 1;
									audio_play_sound(sfx_Gain_Health, 1, false, global.volume_setting, 0, 1);
								}
								array_delete(global.inventory, obj_inventory.pos, 1) 
							break;
							case "Wet Burrito":
							instance_destroy();
							if global.player_health < global.max_player_health {
								global.player_health += 2;
							}
								 array_delete(global.inventory, obj_inventory.pos, 1) 
							break;
							case "Booster":
								instance_destroy();
								if (global.equipped[1] != 0.0) {
										dropItem(convertTo("obj", string(global.equipped[1])));
								}
								array_set(global.equipped, 1, "Booster");
								array_delete(global.inventory, obj_inventory.pos, 1);
							break;
							case "Booster Mod":
								var equippmentSlot = 8;
								instance_destroy();
								if (global.equipped[equippmentSlot] != 0.0) {
										dropItem(convertTo("obj", string(global.equipped[equippmentSlot])));
								}
								array_set(global.equipped, equippmentSlot, "Booster Mod");
								array_delete(global.inventory, obj_inventory.pos, 1);
							break;
							case "Luciferin":
								instance_destroy();
								if (global.equipped[2] != 0.0) {
										dropItem(convertTo("obj", string(global.equipped[2])));
								}
								array_set(global.equipped, 2, "Luciferin");
								array_delete(global.inventory, obj_inventory.pos, 1) 
							break;
							case "Pocket Fish":
								say(["Yep, still in your pocket."]);
							break;
							case "Holy Fish":
								say(["You Squeeze. . ."]);
								array_delete(global.inventory, obj_inventory.pos, 1);
								buyItem("Fish Soul");
							break;
							case "Water Copter":
									instance_destroy();
									if (global.equipped[3] != 0.0) {
											dropItem(convertTo("obj", string(global.equipped[3])));
									}									
									array_set(global.equipped, 3, "Water Copter");
									array_delete(global.inventory, obj_inventory.pos, 1);
							break;
							case "Ancient Map":
									say(["Press " + "Tab" + " to open the map."]);
									instance_destroy();
									if (global.equipped[4] != 0.0) {
											dropItem(convertTo("obj", string(global.equipped[4])));
									}									
									array_set(global.equipped, 4, "Ancient Map");
									array_delete(global.inventory, obj_inventory.pos, 1);
							break;
							case "Mermaid Repellant":
								say([". . .", "Congradulations, now you wont see any Mermaids"]);
								instance_destroy();
								array_delete(global.inventory, obj_inventory.pos, 1);
							break;
							case "Broken Compass":
								say(["You point the compass. It points where you pointed it. You'd be lost without it."]);
							break;
							case "Mystery Key":
								say(splitText("To use this item try to open a door. The use button will not do anything."));
							break;
							case "Steel Harpoon":
								instance_destroy();
									if (global.equipped[0] != 0.0) {
										dropItem(convertTo("obj", string(global.equipped[0])));
									}
									array_set(global.equipped, 0, "Steel Harpoon");
									array_delete(global.inventory, obj_inventory.pos, 1);
							break;
							case "Crab Claw":
								instance_destroy();
								if (global.equipped[0] != 0.0) {
										dropItem(convertTo("obj", string(global.equipped[0])));
								}
								array_set(global.equipped, 0, "Crab Claw");
								array_delete(global.inventory, obj_inventory.pos, 1);
							break;
							case "Depthometer":
								instance_destroy();
								if (global.equipped[5] != 0.0) {
										dropItem(convertTo("obj", string(global.equipped[5])));
								}
								array_set(global.equipped, 5, "Depthometer");
								array_delete(global.inventory, obj_inventory.pos, 1) 
							break;
							case "Healthometer":
								instance_destroy();
								if (global.equipped[6] != 0.0) {
										dropItem(convertTo("obj", string(global.equipped[6])));
								}
								array_set(global.equipped, 6, "Healthometer");
								array_delete(global.inventory, obj_inventory.pos, 1) 
							break;
							case "Pirate Hat":
								instance_destroy();
								if (global.equipped[7] != 0.0) {
										dropItem(convertTo("obj", string(global.equipped[7])));
								}
								array_set(global.equipped, 7, "Pirate Hat");
								array_delete(global.inventory, obj_inventory.pos, 1) 
							break;
							case "Night Vision Goggles":
								instance_destroy();
								if (global.equipped[2] != 0.0) {
										dropItem(convertTo("obj", string(global.equipped[2])));
								}
								array_set(global.equipped, 2, "Night Vision Goggles");
								array_delete(global.inventory, obj_inventory.pos, 1) 
							break;
							case "Fish Food":
								with (obj_diver) {
									var nearestFish = instance_nearest(x, y, obj_Cat_Fish)
									if (distance_to_object(nearestFish) < 500) {
										if (array_contains(global.pets, obj_Cat_Fish) != -1) {
											say(splitText("You hold out the fish food. Your pet swims over and eats it."));
										} else {
											global.petsAge[array_length(global.pets)] = obj_Cat_Fish.age;
											array_push(global.pets, obj_Cat_Fish);
										}
									
									}
								}
								
							break;
							case "Color Mod":
								var equippmentSlot = 9;
								if (global.equipped[2] == "Night Vision Goggles") {
									instance_destroy();
									if (global.equipped[equippmentSlot] != 0.0) {
											dropItem(convertTo("obj", string(global.equipped[equippmentSlot])));
									}
									array_set(global.equipped, equippmentSlot, "Color Mod");
									array_delete(global.inventory, obj_inventory.pos, 1);
								} else {
									say(splitText("You must be wearing night vision goggles to equip this mod."));
								}
								
							break;
							//Default
							default: 
							say(["You cannot use this item."]);
							break;
							}
				}
			global.inventory_menu = false;
			break;
			//Drop
		    case 1:
				dropItem(convertTo("obj", string(global.inventory[obj_inventory.pos])));
				instance_destroy();
			break;
		    //left
		    case 2: 
			if !obj_inventory.pos = 0 {
			array_insert(global.inventory, obj_inventory.pos-1, global.inventory[obj_inventory.pos]) 
			obj_inventory.pos -= 1;
			array_delete(global.inventory, obj_inventory.pos+2, 1);
			}
			break;
			//right
			case 3: 
			if obj_inventory.pos < array_length(global.inventory)-1 {
			array_insert(global.inventory, obj_inventory.pos+2, global.inventory[obj_inventory.pos])
			obj_inventory.pos += 2;
			array_delete(global.inventory, obj_inventory.pos-2, 1);
			obj_inventory.pos -= 1;
			}
			break;
			//back
			case 4: 
			global.inventory_menu = false;
			break;

			 }
		 break;
		}
		
	// set pos back
	if _sml != menu_level {pos = 0};
	
	//correct option length
	op_length = array_length(option[menu_level]);

}

// sound
if (keyboard_check_pressed(obj_settings.key_down)) {
	audio_play_sound(sfx_move_selected, 2 ,false);
	audio_sound_gain(sfx_move_selected, global.volume_setting, 0);
}

if (keyboard_check_pressed(obj_settings.key_up)) {
	audio_play_sound(sfx_move_selected, 2 ,false);
	audio_sound_gain(sfx_move_selected, global.volume_setting, 0);
}