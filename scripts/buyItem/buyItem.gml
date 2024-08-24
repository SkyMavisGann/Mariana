// Script assets have changed for v2.3.0 see
// To be put in step event
function buyItem(itemName){
var inventory_full;
	draw_set_font(global.font_main);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
if (array_length(global.inventory) < 1) { 
	inventory_full = false;	
}


while_counter = 0;

//pickup
var full_length;
		//can move JUST THIS FOR LOOP into obj game but i jus don't feel like it cause it works rn
	for (var i = 0; i < array_length(global.inventory) + 1; i++) {
		if i <= 0 {
			//draw line 1
				full_length = 0;
			} else {
				//draw other lines
				if (full_length + string_width(global.inventory[i - 1]) + string_width(itemName) > 1574) {
					show_debug_message("String width: " + string(full_length + string_width(global.inventory[i - 1])));
					inventory_full = true;
				} else {
				inventory_full = false;
				}
			full_length += (20 + string_width(global.inventory[i-1]));
		}
	}
	if (inventory_full == false && (itemName != "game")) {
		addItem(itemName);
		return true;
	} else {
		return false;
	}
	draw_set_font(spr_font_fundant);
}

