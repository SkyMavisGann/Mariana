width = 150;
height = 150;

op_border = 22;
op_space = 64;

pos = 0;
once = false;

//pause menu
switch (room) {
	case room_shop_top:
		option[0, 0] = "Booster Core";
		option[0, 1] = "Booster";
		option[0, 2] = "Air Tank";
		option[0, 3] = "Soggy Sandwich";
		option[0, 4] = "Ancient Map";
		option[0, 5] = "Mystery Key";
		option[0, 6] = "Water Copter";
		option[0, 7] = "Pearl";
		option[0, 8] = "Mermaid Repellant";
		option[0, 9] = "Pocket Fish";
		option[0, 10] = "Ring";
		option[0, 11] = "Broken Compass";
		option[0, 12] = "Lucky Seashell";
		option[0, 12] = "Steel Harpoon";
	break;
	case room_shop_middle:
		option[0, 0] = "Night Vision Goggles";
		option[0, 1] = "Air Tank";
		option[0, 2] = "Soggy Sandwich";
		option[0, 3] = "Ancient Map";
		option[0, 4] = "Fish Food";
		option[0, 5] = "Pearl";
		option[0, 6] = "Wet Burrito";
		option[0, 7] = "Pocket Fish";
		option[0, 8] = "Ring";
		option[0, 9] = "Broken Compass";
		option[0, 10] = "Gear Shaft";
		option[0, 11] = "Booster Mod";
	break;
}

//settings
option[1, 0] = "Buy"
option[1, 1] = "Back"

op_length = 0;
menu_level = 0;

buttons = [];