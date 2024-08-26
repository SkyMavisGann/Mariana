width = 150;
height = 150;

op_border = 22;
op_space = 64;

pos = 0;
once = false;
option[2, 0] = "Shop";
option[2, 1] = "Talk";
option[2, 2] = "Leave";
//pause menu
switch (room) {
	case room_shop_top:
		option[0, 0] = "Booster Core";
		option[0, 1] = "Booster";
		option[0, 2] = "Air Tank";
		option[0, 3] = "Soggy Sandwich";
		option[0, 4] = "Ancient Map";
		option[0, 5] = "Water Copter";
		option[0, 6] = "Pearl";
		option[0, 7] = "Mermaid Repellant";
		option[0, 8] = "Pocket Fish";
		option[0, 9] = "Broken Compass";
		option[0, 10] = "Lucky Seashell";
		option[0, 11] = "Steel Harpoon";
		option[0, 12] = "Back";
	break;
	case room_shop_middle:
		option[0, 0] = "Night Vision Goggles";
		option[0, 1] = "Air Tank";
		option[0, 2] = "Soggy Sandwich";
		option[0, 3] = "Ancient Map";
		option[0, 4] = "Fish Food";
		option[0, 5] = "Pearl";
		option[0, 6] = "Mystery Key";
		option[0, 7] = "Wet Burrito";
		option[0, 8] = "Ring";
		option[0, 9] = "Broken Compass";
		option[0, 10] = "Gear Shaft";
		option[0, 11] = "Booster Mod";
		option[0, 12] = "Back";
	break;
}

topics[0] = "Current";
topics[1] = "Muro";
topics[2] = "Seeing in the dark";
topics[3] = "Sub Shop";
topics[4] = "Trench"
topics[5] = "Thorium";
topics[6] = "New Gods";
topics[7] = "Yerino";
topics[8] = "Sea Life";
topics[9] = "Depth";
topics[10] = "Creature Parts";
topics[11] = "Land";


var op_pos = 0;
for (var j = 0; j < 4; j++) {
	option[3, j] = "X";
}
for (var i = 0; i < array_length(topics) && op_pos < 4; i++) {
	if (array_contains(obj_settings.achivements, topics[i]) == -1) {
		option[3, op_pos] = topics[i];
		op_pos++;
		//array_push(obj_settings.achivements, topics[i]);
	}
}
option[3, 4] = "Back";

op_length = 0;
menu_level = 2;

buttons = [];