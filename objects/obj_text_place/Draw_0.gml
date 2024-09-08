// draw options
draw_set_font(global.font_main);

var length = array_length(textToDisplay);
if (setup == false) {
	setup = true;
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	if (textToDisplay[0] == "") {
		textToDisplay = splitTextLength(unsplitText, 70 * image_xscale);
		length = array_length(textToDisplay);
		for (var i = 0; i < length; i++) {
			text_length[i] = string_length(textToDisplay[i]);
		}
	}
}

if (pos != length-1) {
	if (draw_char >= text_length[menu_level]) {
		menu_level++;
		pos++;
		draw_char = 0;
	} 
}
 
//dr menu background

if (pos != length) {
	var len = text_length[menu_level];
	if (draw_char < len) {
		if (string_length(textToDisplay) > draw_char) {
			
		}
		draw_char += 1;
	}

		var _c = c_white;

		var _drawtext = string_copy(textToDisplay[menu_level], 1, draw_char);
		draw_text_color(x+op_border, y+op_border + op_space*menu_level, _drawtext, _c, _c, _c, _c, 1 );

		for (var i = 0; i < menu_level; i++) {
			draw_text_color(x+op_border, y+op_border + op_space*i, textToDisplay[i], _c, _c, _c, _c, 1 );
		}		

}
