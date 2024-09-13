width = 220;
height = 88;


op_border = 44;
op_space = 64;

pos = 0;

//pause menu
option[0, 0] = "Play Again";
option[0, 1] = "Quit Game"

//settings
option[1, 0] = "Window Size"
option[1, 1] = "Brightness"
option[1, 2] = "Controls"
option[1, 3] = ("Volume: " + string(global.volume_setting)) 
option[1, 4] = "Back"

op_length = 0;
menu_level = 0;

buttons = [];

with (obj_button) {
	instance_destroy();
}