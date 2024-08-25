// draw options
draw_set_font(global.font_main);

var length = array_length(textToDisplay);
if (setup == false) {
	setup = true;
	
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	
	for (var i = 0; i < length; i++) {
		text_length[i] = string_length(textToDisplay[i]);
	}

}

width = 433;
height = 16 + (18 * (menu_level + 1));

//center

x = 490;
y = 200;
 
//dr menu background

var textSpeed = obj_settings.textSpeed;
if (pos != length) {
	if (draw_char < text_length[menu_level]) {
		if (string_length(textToDisplay) > draw_char) {
			var currentLetter = string_char_at(textToDisplay[menu_level], draw_char);
			if (currentLetter == "," || currentLetter == "." || currentLetter == "?" || currentLetter == "!" || currentLetter == ";") {
				textSpeed = textSpeed * 0.1;
			}
		}
		draw_char += textSpeed;
	}


	draw_sprite_ext(sprite_index, image_index, x, y, width/sprite_width*3, height/sprite_height*3, 0, c_white, 1);

		var _c = c_white;

		var _drawtext = string_copy(textToDisplay[menu_level], 1, draw_char);
		draw_text_color(x+op_border, y+op_border + op_space*menu_level, _drawtext, _c, _c, _c, _c, 1 );

		for (var i = 0; i < menu_level; i++) {
			draw_text_color(x+op_border, y+op_border + op_space*i, textToDisplay[i], _c, _c, _c, _c, 1 );
		}		

}

