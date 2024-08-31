global.font_main = font_add_sprite(spr_font_fundant, 32, true, 1);
global.volume_setting = 1.00;
initKeys();

gamepad_set_axis_deadzone(0, 0.3);

//Controls
	key_escape = vk_escape;
	key_select = vk_space;
	key_dash = vk_shift;

	key_down = ord("S");
	key_up = ord("W");

	key_left = ord("A");
	key_right = ord("D");

	key_map = vk_tab;
	key_attack = mb_left;

	key_inventory = ord("I");

	textSpeed = 0.5;
	textpos = 1;

	fullscreen = false;
	Resolution = [display_get_width(), display_get_height()]; 
	respos = 3;
	bloodEnable = true;
	blood = true;
	Borderless = false;
	
	Automatic_pickup = true;
	Debug_Console = false;
	try {
	if (file_exists("settings.save")) {
		var _buffer = buffer_load("settings.save");
		var _string = buffer_read(_buffer, buffer_string);
		buffer_delete(_buffer);
		var _loadData = json_parse(_string);

		var _loadEntity = array_pop(_loadData);	
		if (struct_names_count(_loadEntity) == 21) {
			global.volume_setting = _loadEntity.volume_setting;
			key_escape = _loadEntity.key_escape;
			key_select = _loadEntity.key_select;
			key_dash = _loadEntity.key_dash;

			key_down = _loadEntity.key_down;
			key_up = _loadEntity.key_up;

			key_left = _loadEntity.key_left;
			key_right = _loadEntity.key_right;

			key_map = _loadEntity.key_map;
			key_attack = _loadEntity.key_attack;

			key_inventory = _loadEntity.key_inventory;

			textSpeed = _loadEntity.textSpeed;
			textpos = _loadEntity.textpos;
			fullscreen = _loadEntity.fullscreen;
			Resolution = _loadEntity.Resolution; 
			respos = _loadEntity.respos;
			bloodEnable = _loadEntity.bloodEnable;
			blood = _loadEntity.blood;
			Borderless = _loadEntity.Borderless;
			Automatic_pickup = _loadEntity.Automatic_pickup;
			Debug_Console = _loadEntity.Debug_Console;
		}
	}
	} catch (e) {
		show_debug_message(e);
	}
// saying for text
currentlySaying = [];
timesEnteredSub = 0;

//a variable to send a message to obj_diver when he needs to load his stats
needsToBeLoaded = false;
needsDeathLoaded = false;
loadPlayer = true;

needsLoading = [];

//a variable for waiting till you're in the room you died in

spawnX = 0;
spawnY = 0;
location1 = Room1;

//A variable to store where you used to be so you can be moved to correct cordinates
previousRoom = Room1;
code = "bimble";

achivements = [];

instance_create_layer(500, 500, "Instances", obj_start_menu);

window_set_fullscreen(obj_settings.fullscreen);
window_set_size(obj_settings.Resolution[0], obj_settings.Resolution[1]);
obj_settings.blood = obj_settings.bloodEnable;
window_set_showborder(!obj_settings.Borderless);
window_center();
alarm[0] = 1;

placeholderEquippment = [];
