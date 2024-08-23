//saves a list of variables and arrays in a struct and places them in savedgame.save
function saveGame(saveName){
				instance_activate_object(obj_diver);
				instance_activate_object(obj_creature_parent);
				instance_activate_object(obj_fish_egg);
				// save data
				var _saveData = array_create(0);
				with (obj_item_parent)
				{
					var _saveItem = 
					{
						obj : object_get_name(object_index),
						y : y,
						x : x,
						randDir : randDir,
						randDir2 : randDir2,
						image_angle : image_angle,
					}
					array_push(_saveData, _saveItem);
				}
				with (obj_creature_parent)
				{
					var _saveItem = 
					{
						obj : object_get_name(object_index),
						y : y,
						x : x,
						HP : HP,
						age : age,
						laidEggs : laidEggs,
						layingEggsAge : layingEggsAge,
					}
					array_push(_saveData, _saveItem);
				}
				with (obj_fish_egg)
				{
					var _saveItem = 
					{
						obj : object_get_name(object_index),
						y : y,
						x : x,
						age : age,
						hue : hue,
						fish : fish,
					}
					array_push(_saveData, _saveItem);
				}
				with (obj_chest)
				{
					var _saveChest = 
					{
						obj : object_get_name(object_index),
						y : y,
						x : x,
						container : container,
						opened : opened,
						image_xscale : image_xscale,
					}
					array_push(_saveData, _saveChest);
				}
				with (obj_destructible_parent)
				{
					var _saveDest = 
					{
						obj : object_get_name(object_index),
						y : y,
						x : x,
						image_yscale : image_yscale,
						image_xscale : image_xscale,
						image_angle : image_angle,
					}
					array_push(_saveData, _saveDest);
				}
				with (obj_dead_diver)
				{
					var _saveDead = 
					{
						obj : object_get_name(object_index),
						y : y,
						x : x,
						container : container,
						opened : opened,
						image_xscale : image_xscale,
						location : room,
					}
					array_push(_saveData, _saveDead);
				}
				
				with (obj_diver) 
				{
					var _saveEntity = 
					{
						location : room,
						y : y,
						x : x,
						num_chests : instance_number(obj_chest),
						num_items : instance_number(obj_item_parent),
						num_dead : instance_number(obj_dead_diver),
						num_fish : instance_number(obj_creature_parent),
						num_eggs : instance_number(obj_fish_egg),
						num_dest : instance_number(obj_destructible_parent),
						achivements : obj_settings.achivements,
						inventory : global.inventory,
						player_health : global.player_health,
						max_player_health : global.max_player_health,
						equipped : global.equipped,
						pets : global.pets,
						petsAge : global.petsAge,
						spawnedBody : global.spawnedBody,
						bosses_beaten : global.bosses_beaten,
						timesEnteredSub : obj_settings.timesEnteredSub,
						oxygen : global.oxygen,
						oceanDepth : global.oceanDepth,
						roomsWithCorpses : global.roomsWithCorpses,
						doorInRoomMain : global.doorInRoomMain
					}
					array_push(_saveData, _saveEntity);
				}
				//JSON saving
				var _string = json_stringify(_saveData);
				var _buffer = buffer_create(string_byte_length(_string) +1, buffer_fixed, 1);
				buffer_write(_buffer, buffer_string, _string);
				buffer_save(_buffer, saveName);
				buffer_delete(_buffer);
				
				show_debug_message("Game Saved: " + _string);
				
}