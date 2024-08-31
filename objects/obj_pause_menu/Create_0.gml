 width = 220;
height = 88;


op_border = 44;
op_space = 64;

pos = 0;

locked = false;
var scale = 2;
image_xscale = scale;
image_yscale = scale;

//pause menu
option[0, 0] = "Resume Game";
option[0, 1] = "Settings";
option[0, 2] = "Save and Quit";
//settings
option[1, 0] = "Video";
option[1, 1] = "Gameplay";
option[1, 2] = "Controls";
option[1, 3] = ("Volume: " + (string_format(global.volume_setting*100, 3, 0)));
option[1, 4] = "Back";

//controls

controlsArray = ["Up", "Left", "Down", "Right", "Interact", "Attack", "Map", "Boost", "Escape", "Inventory"];
currentControls = [obj_settings.key_up, obj_settings.key_left
, obj_settings.key_down, obj_settings.key_right
, obj_settings.key_select, obj_settings.key_attack
, obj_settings.key_map, obj_settings.key_dash
, obj_settings.key_escape, obj_settings.key_inventory];
for (var i = 0; i < 10; i++) {
	option[2, i] = controlsArray[i] + ": " + global._fhinputKeys[currentControls[i]];
}
option[2, 10] = "Back";


option[3, 0] = "Full Screen: " + toBoolOrBinary(obj_settings.fullscreen);
option[3, 1] = "Borderless Window: " + toBoolOrBinary(obj_settings.Borderless)
resOptions = ["800x600", "1280x720", "1600x900", "1920x1080", "2560x1440", "3840x2160"];
option[3, 2] = "Resolution: " + string(obj_settings.Resolution[0]) + "x" + string(obj_settings.Resolution[1]);
textOptions = ["Slow", "Medium", "Fast", "ULTRA"];
option[3, 3] = "Text Speed: " + textOptions[obj_settings.textpos];
option[3, 4] = "Blood: " + toBoolOrBinary(obj_settings.bloodEnable);
option[3, 5] = "Apply";
option[3, 6] = "Back";

option[4, 0] = "Automatic Pickup: " + toBoolOrBinary(obj_settings.Automatic_pickup);
option[4, 1] = "Debug Console: " + toBoolOrBinary(obj_settings.Debug_Console);
option[4, 2] = "Back";

op_length = 0;
menu_level = 0;

buttons = [];

