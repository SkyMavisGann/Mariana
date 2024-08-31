//saves a list of variables and arrays in a struct and places them in savedgame.save
function saveSettings(){
				// save data
				var _saveData = array_create(0);
				with (obj_settings) 
				{
					var _saveEntity = 
					{
						volume_setting : global.volume_setting,
						key_escape : key_escape,
						key_select : key_select,
						key_dash : key_dash,

						key_down : key_down,
						key_up : key_up,

						key_left : key_left,
						key_right : key_right,

						key_map : key_map,
						key_attack : key_attack,

						key_inventory : key_inventory,

						textSpeed : textSpeed,
						textpos : textpos,
						respos : respos,
						bloodEnable : bloodEnable,
						fullscreen : fullscreen,
						Resolution : Resolution,

						blood : blood,
						Borderless : Borderless,
						Automatic_pickup : Automatic_pickup,
						Debug_Console : Debug_Console
					}
					array_push(_saveData, _saveEntity);
				}
				//JSON saving
				var _string = json_stringify(_saveData);
				var _buffer = buffer_create(string_byte_length(_string) +1, buffer_fixed, 1);
				buffer_write(_buffer, buffer_string, _string);
				buffer_save(_buffer, "Settings.save");
				buffer_delete(_buffer);
				
				show_debug_message("Settings Saved: " + _string);
				
}