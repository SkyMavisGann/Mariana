 // draw options

draw_set_font(global.font_main);
draw_set_valign(fa_top);
draw_set_halign(fa_left);


//center

if (room != room_shop_top) {
	x = 170;
	y = 100;
}

//dr menu background

draw_sprite_ext(sprite_index, image_index, x, y, width/sprite_width*3, height/sprite_height*3, 0, c_white, 1);


op_length = array_length(global.inventory);

for (var i = 0; i < op_length; i++) {
	
	var _c = c_white;
	if pos == i {_c = c_yellow};
	if (array_contains(equippableItems, global.inventory[i]) != -1) {
		if pos == i {_c = make_color_rgb(117, 154, 255);};
	}
	if (array_contains(useableItems, global.inventory[i]) != -1) {
		if pos == i {_c = make_color_rgb(255, 128, 171);};
	}
	
  if i <= 0 {
	  //draw line 1
		  var full_length = 0;
		  draw_text_color(x+op_border + op_space*0, y+op_border, global.inventory[0], _c, _c, _c, _c, 1);
		  var maxButtons = array_length(global.inventory);
			if (instance_exists(obj_inventory_use)) {
				maxButtons += array_length(obj_inventory_use.option[obj_inventory_use.menu_level]);
			}
			if (instance_number(obj_button) < maxButtons) {
				var button = instance_create_layer(x+op_border + op_space*0, y+op_border, "menu_layer", obj_button);
				var stringWidth = string_width(global.inventory[i])
				button.image_xscale = stringWidth/80;
				button.image_yscale = 0.4;
				button.obj = object_index;
				button.menu_level = 0;
				button.index = i;
				array_set(buttons, i, button.id);
				}
	} 
	  else {
		  //draw other lines
		draw_text_color(x+op_border + op_space + string_width(global.inventory[i-1]) + full_length, y+op_border, global.inventory[i], _c, _c, _c, _c, 1 );
		
				
		//if (array_length(global.inventory) > 0) {
		//	if (sprite_exists((convertTo("spr", global.inventory[i])))) {
		//		draw_sprite_ext(convertTo("spr", global.inventory[i]), 0, x+op_border + op_space + string_width(global.inventory[i-1]) + full_length - 15, y+op_border + 20,1, 1, 0, c_white, 1);
		//	}
		//}
		var maxButtons = array_length(global.inventory);
		if (instance_exists(obj_inventory_use)) {
			maxButtons += array_length(obj_inventory_use.option[obj_inventory_use.menu_level]);
		}
		if (instance_number(obj_button) < maxButtons) {
			var button = instance_create_layer(x+op_border + op_space + string_width(global.inventory[i-1]) + full_length, y+op_border, "menu_layer", obj_button);
			var stringWidth = string_width(global.inventory[i])
			button.image_xscale = stringWidth/80;
			button.image_yscale = 0.4;
			button.obj = object_index;
			button.menu_level = 0;
			button.index = i;
			array_set(buttons, i, button.id);
		  }
		  full_length += (op_space + string_width(global.inventory[i-1]));
	}
	//show Red Names
	if (i = array_length(global.inventory) - 1) {
		with (obj_diver) {
			var nearest = instance_nearest(x,y, obj_item_parent);
			if (nearest != noone && distance_to_object(nearest) < 100) {
				with (nearest) {
					if (showName) {
						draw_text_color(obj_inventory.x+obj_inventory.op_border + obj_inventory.op_space + string_width(global.inventory[i]) + full_length, obj_inventory.y+obj_inventory.op_border, (convertTo("name", object_get_name(object_index))) , c_red, c_red, c_red, c_red, obj_game.text_opacity * 4);				
					}
				}
			}
		}
	}

}
if (array_length(global.inventory) < 1) {
	with (obj_diver) {
		var nearest = instance_nearest(x,y, obj_item_parent);
		if (nearest != noone && distance_to_object(nearest) < 100) {
			with (nearest) {
				if (showName) {
					draw_text_color(obj_inventory.x+obj_inventory.op_border + obj_inventory.op_space*0, obj_inventory.y+obj_inventory.op_border, (convertTo("name", object_get_name(object_index))), c_red, c_red, c_red, c_red, obj_game.text_opacity * 4);				
				}
			}
		}
	}
}

