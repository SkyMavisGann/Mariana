if aTimer >= 1 {aTimer -= 1;}

if (!instance_exists(harpoon1)) {
	instance_create_layer(0, 0, "player_layer", harpoon1);
}

if (array_contains(obj_settings.achivements, "PlayedTheGame") == -1) {
	playIntroAnimation = true;
	array_push(obj_settings.achivements, "PlayedTheGame");
}
step += delta_time;
var seconds = step / 1000;
if (playIntroAnimation) {
	
	
	if (seconds < 1000) {
		var vx = 700;
		var vy = 880;
			var angleBetween = point_direction(x, y, vx, vy) + 90;
			var hypot = sqrt(sqr(vx) + sqr(vy));
			var TentacleX = ((hypot * 1) * dsin(angleBetween + image_angle));
			var TentacleY = ((hypot * 1) * dcos(angleBetween + image_angle));
			var xChanged = (TentacleX / max(abs(TentacleX), abs(TentacleY)));
			var yChanged = (TentacleY / max(abs(TentacleX), abs(TentacleY)));
			if (seconds < 500) {
				swimAccelerationX = 6;
				speX = 10;
				swimAccelerationY = 6;
				speY = 12;
			}
			
			if (!audio_is_playing(sfx_splash)) {
				audio_play_sound(sfx_splash, 0, false, global.volume_setting, 0, 1);
			}
			if (!audio_is_playing(sfx_boost)) {
				audio_sound_gain(sfx_boost, global.volume_setting, 0);
				audio_play_sound(sfx_boost, 1, true, global.volume_setting + 0.1);
			}
			if (delta_time & 10 == 0) {
				instance_create_layer(x + irandom_range(-10, 10) ,y + irandom_range(-10, 10), "behind_diver", vfx_bubble);
			}
			swimAccelerationX = clamp(swimAccelerationX + (xChanged * 0.02), -9, 9);
			speX = clamp(speX + swimAccelerationX, -abs(swimMax), abs(swimMax));
				
			swimAccelerationY = clamp(swimAccelerationY + (yChanged * 0.02), -9, 9);
			speY = clamp(speY + swimAccelerationY, -abs(swimMax), abs(swimMax));
		} else {
			audio_sound_gain(sfx_boost, 0, 500);
			var Adrag = 0.1;
			if (swimAccelerationX > 0) {
				swimAccelerationX -= Adrag;
			} else if (swimAccelerationX < 0) {
				swimAccelerationX += Adrag;
			}
			if (swimAccelerationY > 0) {
				swimAccelerationY -= Adrag;
			} else if (swimAccelerationY < 0) {
				swimAccelerationY += Adrag;
			}
		}
		if (!place_meeting(x+speX,y+speY,obj_collision_parent)) {
			x += speX;
			y += speY;
		}
		if (place_meeting(x+speX,y,obj_collision_parent)) {
			swimAccelerationX = 0;
			speX = 0;
			
		}
		if (place_meeting(x,y+speY,obj_collision_parent)) {
			swimAccelerationY = 0;
			speY = 0;
		}
		if (speY == 0 && speX == 0) {
			playIntroAnimation = false;
		}
}


//floating animation
if (attackingANI = 0 && ((sprite_index != spr_divr_attacking_side) || (sprite_index != spr_diver_attacking_up) || (sprite_index != spr_diver_attacking_down))) {
	if ((keyboard_check(obj_settings.key_left) = 0) && (keyboard_check(obj_settings.key_right) = 0)) {
	sprite_index = spr_floating;

	} else {
		sprite_index = spr_swimming;
	}
 }

// get keys
if (global.inventoried == false) {
		if (swim_speed != 6.5 || swim_speed != 10) {
		key_w = (keyboard_check(obj_settings.key_up) || (gamepad_axis_value(0, gp_axislv) < 0));
		key_s = (keyboard_check(obj_settings.key_down) || (gamepad_axis_value(0, gp_axislv) > 0));
		key_a = keyboard_check(obj_settings.key_left) || (gamepad_axis_value(0, gp_axislh) < 0);
		key_d = keyboard_check(obj_settings.key_right) || (gamepad_axis_value(0, gp_axislh) > 0);
		}
}
if key_a == 1 {
	image_xscale = -1;
	if (attacking == 0) {
		input_direction = 180;
	}
}
if key_d == 1 {
	if (attacking == 0) {
		input_direction = 0;
	}
	image_xscale = 1;
}
if key_s == 1 {
	if ((keyboard_check(obj_settings.key_up) = 0) && (keyboard_check(obj_settings.key_left) = 0) && (keyboard_check(obj_settings.key_right) = 0)) {
		if (attacking == 0) {
			input_direction = 270;
		}
	}
}
if key_w == 1 {
	if (attacking == 0) {
		input_direction = 90;
	}
}

	var Hmove = key_d - key_a;

	hsp = Hmove * swim_speed;

	var Vmove = key_s - key_w;

	vsp = Vmove * swim_speed;

while_counter = 0;

//set index to normal diver
if (place_meeting(x,y+swim_speed,obj_collision_parent)) {
	 if attackingANI = 0 {
		sprite_index = spr_diver;
	}
}

//vertical moving collide
if (place_meeting(x,y+vsp,obj_collision_parent)) {
while (!place_meeting(x,y+sign(vsp),obj_collision_parent) && (while_counter < 50)) {
  y = y + sign(vsp);
  while_counter = while_counter + 1;
   }
 vsp = 0;
}
// horizontal moving collide
if (place_meeting(x+hsp,y,obj_collision_parent)) {
while ((!place_meeting(x+sign(hsp),y,obj_collision_parent)) && (while_counter < 50)) {
  x = x + sign(hsp);
  while_counter = while_counter + 1;
   }
 hsp = 0;
}

// don't move if map open or inventory open
if (global.inventoried == false && (obj_game.mapOpen == false)) {
	x = x + hsp;
	y = y + vsp;
}

if (attacked_recently >= 1) {
	attacked_recently -= 1;
}

// Set the audio listener's position to the player's position
audio_listener_position(x, y, 0);

if ANItimer > 0 {ANItimer -= 1;}

if (flashAlpha > 0) {
	flashAlpha -= 0.04;
}

//being flung after getting hit
if (flashAlpha > 0.32) {
	var xway = x - attackedFromX;
	var yway = y - attackedFromY;
	if (!place_meeting(x + xway,y + yway, obj_collision_parent)) {
		move_towards_point(attackedFromX, attackedFromY, -6);
	}
	
	if (place_meeting(x, y, obj_collision_parent)) {
		move_towards_point(attackedFromX, attackedFromY, 7);
	}
} 

if (flashAlpha = 0.32) {
	speed = 0;
}

//---------------------------- TAKKING OF DAMAGE
if global.player_health <= 0 {
	
	if (!instance_exists(obj_diver_death)) {
		audio_play_sound(sfx_die, 1, false, global.volume_setting + 0.2, 0, 1);
		image_alpha = 0;
		var ins = instance_create_layer(x,y, "in_front_of_player", obj_diver_death);
		ins.image_index = 0;
		var shine = instance_create_layer(x, y, "behind_diver", vfx_shine_player_Death);
		shine.image_index = 0;
	}
} else {
	global.spawnedBody = false;
}

if (instance_exists(obj_diver_death) && obj_diver_death.image_index == obj_diver_death.image_number) {
	if (!global.spawnedBody) {
		
		with (instance_create_layer(x, y, "player_layer", obj_dead_diver)) {
			container = global.inventory;
		}
		global.spawnedBody = true;
		saveGame(string(room) + ".save");
		saveGame("savedgame.save");
		show_debug_message("Died");
		array_push(global.roomsWithCorpses, room);
	}
	room_goto(roomDeath);
}

var drag = 0.1;
if (speX > 0) {
	speX -= drag;
} else if (speX < 0) {
	speX += drag;
}
if (speY > 0) {
	speY -= drag;
} else if (speY < 0) {
	speY += drag;
}
if (abs(speX) < drag) {
	speX = 0;
}
if (abs(speY) < drag) {
	speY = 0;
}

//booster stuff
if (global.equipped[1] == "Booster") {
	if (global.equipped[8] == "Booster Mod") {
		if ( keyboard_check(obj_settings.key_dash)) {
			
			var angleBetween = point_direction(x, y, mouse_x, mouse_y) + 90;
			var hypot = sqrt(sqr(mouse_x) + sqr(mouse_y));
			var TentacleX = ((hypot * 1) * dsin(angleBetween + image_angle));
			var TentacleY = ((hypot * 1) * dcos(angleBetween + image_angle));
			var xChanged = (TentacleX / max(abs(TentacleX), abs(TentacleY)));
			var yChanged = (TentacleY / max(abs(TentacleX), abs(TentacleY)));
			
			if (global.oxygen >= 1) {
				if (!audio_is_playing(sfx_boost)) {
					audio_sound_gain(sfx_boost, global.volume_setting, 0);
					audio_play_sound(sfx_boost, 1, true, global.volume_setting + 0.1);
				}
				if (delta_time & 10 == 0) {
					instance_create_layer(x + irandom_range(-10, 10) ,y + irandom_range(-10, 10), "behind_diver", vfx_bubble);
				}
				if ((swimAccelerationX > 0 && xChanged < 0) || (swimAccelerationX < 0 && xChanged > 0)) {
					swimAccelerationX = 0;
				}
				if ((swimAccelerationY > 0 && yChanged < 0) || (swimAccelerationY < 0 && yChanged > 0)) {
					swimAccelerationY = 0;
				}
				swimAccelerationX = clamp(swimAccelerationX + (xChanged * 0.02), -9, 9);
				speX = clamp(speX + swimAccelerationX, -abs(swimMax), abs(swimMax));
				
				swimAccelerationY = clamp(swimAccelerationY + (yChanged * 0.02), -9, 9);
				speY = clamp(speY + swimAccelerationY, -abs(swimMax), abs(swimMax));
				global.oxygen -= 0.05;
			} else {
				
				var Adrag = 0.1;
				if (swimAccelerationX > 0) {
					swimAccelerationX -= Adrag;
				} else if (swimAccelerationX < 0) {
					swimAccelerationX += Adrag;
				}
				if (swimAccelerationY > 0) {
					swimAccelerationY -= Adrag;
				} else if (swimAccelerationY < 0) {
					swimAccelerationY += Adrag;
				}
			}
		} else {
			audio_sound_gain(sfx_boost, 0, 500);
			var Adrag = 0.1;
			if (swimAccelerationX > 0) {
				swimAccelerationX -= Adrag;
			} else if (swimAccelerationX < 0) {
				swimAccelerationX += Adrag;
			}
			if (swimAccelerationY > 0) {
				swimAccelerationY -= Adrag;
			} else if (swimAccelerationY < 0) {
				swimAccelerationY += Adrag;
			}
		}
		if (!place_meeting(x+speX,y+speY,obj_collision_parent)) {
			x += speX;
			y += speY;
		}
		if (place_meeting(x+speX,y,obj_collision_parent)) {
			swimAccelerationX = 0;
			speX = 0;
		}
		if (place_meeting(x,y+speY,obj_collision_parent)) {
			swimAccelerationY = 0;
			speY = 0;
		}
	} else {
		if ( keyboard_or_mouse_check_pressed(obj_settings.key_dash) && boosterCooldown <= 0) {
			boosterTimer = 15;
			boosterCooldown = 30;
			audio_sound_gain(sfx_boost, global.volume_setting, 0);
			audio_play_sound(sfx_boost, 1, false, global.volume_setting);
			audio_sound_gain(sfx_boost, 0, 500);
		}
		if (boosterTimer > -1) {
			boosterTimer--;
			swim_speed = default_move_speed;
		}
		if (boosterCooldown > 0) {
			boosterCooldown--;
		}
		if (boosterTimer > 0) {
			swim_speed = 10;
			if (delta_time & 10 == 0) {
				instance_create_layer(x + irandom_range(-10, 10) ,y + irandom_range(-10, 10), "behind_diver", vfx_bubble);
			}
		}
	}
}
if (audio_is_playing(sfx_boost) && audio_sound_get_gain(sfx_boost) == 0 && global.volume_setting != 0) {
	audio_stop_sound(sfx_boost);
}

bubbleTimer++;
if (bubbleTimer > 60) {
	bubbleTimer = 0;
	instance_create_layer(x+random_range(-20,20), y+random_range(-20,20), "behind_diver", vfx_bubble);
}

if (global.oxygen <= 0 && bubbleTimer == 59) {
	delt(1, x, y+1);
}


if (keyboard_or_mouse_check_pressed(obj_settings.key_attack)) {
	/// @description attacking
	if (global.inventoried == false && (obj_game.mapOpen == false)) {
	switch (global.equipped[0]) {
		case "Basic Harpoon":
			global.attack_damage = 1;
		break;
		case "Steel Harpoon":
			global.attack_damage = 1.5;
		break;
		case "Crab Claw":
			global.attack_damage = 2;
		break;
		default:
			global.attack_damage = 1;
		break;
	}
	if (attacking == 0) {
	image_index = 0;
	attacking = 1;
	}

	attackingANI = 1;
	ANItimer = 0;

	attacked_recently = 120;
	// attacking
		if (aTimer <= 0) {

			aTimer = 58;

			if (input_direction = 0) {
				image_xscale = 1;

				sprite_index = spr_divr_attacking_side;
				audio_sound_gain(sfx_attacking_any,global.volume_setting, 0)
				audio_play_sound(sfx_attacking_any, 5, false);
			} else {
			 if (input_direction = 180)
			 {
			 image_xscale = -1;

			 sprite_index = spr_divr_attacking_side;
			 audio_sound_gain(sfx_attacking_any,global.volume_setting, 0)
			 audio_play_sound(sfx_attacking_any, 5, false);
			 } else {
				 if (input_direction = 90) {
		
					sprite_index = spr_diver_attacking_up;
				   if sprite_index = spr_diver_attacking_up {
			   audio_sound_gain(sfx_attacking_any,global.volume_setting, 0);
			audio_play_sound(sfx_attacking_any, 5, false);
				   }
			   } else {
			    if (input_direction = 270) {
			
					sprite_index = spr_diver_attacking_down;
			
					if sprite_index = spr_diver_attacking_down {
						audio_sound_gain(sfx_attacking_down,global.volume_setting, 0);
						audio_play_sound(sfx_attacking_down, 5, false);
						global.attack_damage *= irandom_range(1.01, 1.5); 
						swim_speed = 6.5;
					}
				}
			   }
			 }
			}
		}
}

}


if (image_index >= image_number - 0.07) {
	if (sprite_index != spr_diver && (sprite_index != spr_floating) && sprite_index != spr_swimming) {
		attackingANI = 0;

		if ANItimer > 0 {
			ANItimer -= 1;
		}
		sprite_index = spr_floating;
		if (attacking == 1) {
			attacking = 0;
		}
		swim_speed = default_move_speed;
	}


}

if (keyboard_check_pressed(vk_f1)) {
	if (!instance_exists(obj_text_input)) {
		debugMenu = instance_create_layer(x, y, "menu_layer", obj_text_input);
	} else {
		instance_destroy(debugMenu);
	}
}

for (var i = 0; i < array_length(global.pets); i++) {
	if (!instance_exists(global.pets[i])) {
		instance_create_layer(x, y, "player_layer", global.pets[i]);
	}
}