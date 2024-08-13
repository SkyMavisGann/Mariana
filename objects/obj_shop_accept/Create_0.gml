
width = 50;
height = 50;


op_border = 24;
op_space = 44;

pos = 0;

//pause menu
option[0, 0] = "Buy";
option[0, 1] = "Back";



op_length = 0;
menu_level = 0;

function displayPrice(items) {
	var posx = 200;
	var posy = 760;
	draw_sprite_ext(sprite_index, image_index, posx, posy, (array_length(items)*35)/sprite_width*3, 75/sprite_height*3, 0, c_white, 1);
	for (var i = 0; i < array_length(items); i++) {
		
		draw_sprite_ext(convertTo("spr", items[i]), 0, (posx + 50) + (i*100), posy + 110,5, 5, 0, c_white, 1);
	}
}

function getPrices(item) {
switch (item) {
					//booster core
					case "Booster Core": 
						return ["Thorium", "Thorium", "Mauler Fin", "Mauler Fin"];
					break;
					//Booster
					case "Booster": 
						return ["Air Tank", "Booster Core", "Air Tank", "Scrap"];
					break;
					//Oxygen Tank
					case "Air Tank":
						return ["Ice", "Ice", "Ice"];
					break;
					// Soggy Sandwich
					case "Soggy Sandwich":
						return ["Fish Eye", "Ice"];
					break;
					case "Ancient Map":
						return ["Fish Eye", "Fish Eye"];
					break;
					case "Mystery Key":
						return ["Pearl", "Water", "Mauler Fin"];
					break;
					case "Pocket Fish":
						return ["Soggy Sandwich", "Mauler Fin"];
					break;
					case "Mermaid Repellant":
						return ["Water", "Ice", "Scales"];
					break;
					case "Water Copter":
						return ["Air Tank", "Pearl", "Scrap"];
					break;
					case "Pearl":
						return ["Scales"];
					break;
					case "Broken Compass":
						return ["Scales", "Scrap", "Pearl"];
					break;
					case "Lucky Seashell":
						return ["Thorium", "Soggy Sandwich", "Pearl"];
					break;
					case "Ring":
						return ["Thorium", "Scrap", "Ice"];
					break;
					case "Steel Harpoon":
						return ["Scrap", "Scrap", "Scrap"];
					break;
					case "Night Vision Goggles":
						return ["Pearl", "Ice"];
					break;
					case "Fish Food":
						return ["Fins", "Water", "Water"];
					break;
					case "Wet Burrito":
						return ["Oris Tentacle", "Ice"];
					break;
					default:
						return ["Ice"];
					break;
				}
}

buttons = [];