// draw options

draw_set_font(global.font_main);
draw_set_valign(fa_center);
draw_set_halign(fa_center);


//center

x = (display_get_width() / 2) - sprite_width;
y = view_get_hport(view_camera[0])/2;
 
//dr menu background

draw_sprite_ext(sprite_index, image_index, x, y, width/sprite_width*3, height/sprite_height*3, 0, c_white, 1);




for (var i = 0; i < op_length; i++) {
	
	var _c = c_white;
	if pos == i {_c = c_yellow};
  draw_text_color(x+op_border, y+op_border + op_space*i, option[menu_level, i], _c, _c, _c, _c, 1 );
  	var numButt = instance_number(obj_button);
		if (numButt < op_length) {
			var offset = 1
			var button = instance_create_layer(((x+op_border)/offset), ((y + op_border) + op_space*i)/offset, "menu_layer", obj_button);
			var stringWidth = string_width(option[menu_level, i])
			button.image_xscale = stringWidth/80;
			button.image_yscale = 0.4;
			button.obj = object_index;
			button.menu_level = menu_level;
			button.index = i;
			array_set(buttons, i, button.id);
		}
}


