flashAlpha = 0;
flashColor = c_white;

debug = false;
aTimer = 0;
swim_speed = 3;


//for booster mod
swimAccelerationX = 0;
swimAccelerationY = 0;
swimMax = 12;
speX = 0;
speY = 0;

StaredAtWater = 0;
hsp = 0;
vsp = 0;
default_move_speed = swim_speed;
input_direction = 0;

attacking = 0;
attackingANI = 0;
attacked_recently = 0;
ANItimer = 0;
boosterTimer = -1
boosterCooldown = 0;

attackedFromX = 0;
attackedFromY = 0;
loadPetAge = false;

bubbleTimer = 0;

debugMenu = noone;

blindness = 0;
// A variable to choose the frame of the animation on the reward you get when you beat a boss

bossRewardAnimationFrame = 6;
bossRewardAnimationFrameTimer = 0;

gamepad_set_axis_deadzone(0, 0.3);

if !variable_global_exists("equipped") {
	global.max_player_health = 4;
	global.attack_damage = 1;
	global.inventory = ["Air Tank", "Soggy Sandwich"];
	global.equipped = ["Basic Harpoon", 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0];
	global.player_health = global.max_player_health;
	global.pets = [];
	global.petsAge = [];
	//player_attack_damage = 1;
	inventory_full = false;
	obj_oxygen_indicator.refilling = 0;
	global.bosses_beaten = [0.0];
	global.oceanDepth = 425;
	global.roomsWithCorpses = [];
	
	global.doorInRoomMain = [];
	for (var i = 0; i < real(room_shop_bottom); i++) {
		array_push(global.doorInRoomMain, 0);
	}
	array_set(global.doorInRoomMain, Room1, [[Room1], [0, 0]]);
}

if (array_length(global.equipped) < 3) {
	array_push(global.equipped, 0.0);
}

if !variable_global_exists("previous_x") {
	global.previous_x = obj_diver.x;
}

//deactive inventory menu
instance_deactivate_object(obj_inventory_use);

//backup if you leave, this will cause the ice timer to reset but i am not saving that value
var len = array_length(global.inventory);
if (array_count(global.inventory, "Ice") - instance_number(obj_Ice_timer) > 0) {
	for (var i = 0; i < len; i++) {
		if (global.inventory[i] == "Ice") {
			with (instance_create_layer(0, 0, "player_layer", obj_Ice_timer)) {
				index = i;
			}
		} 
	}
}
