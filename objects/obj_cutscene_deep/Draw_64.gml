// draw options
draw_set_font(global.font_main);
if (setup == false) {
	setup = true;
	
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	
	for (var i = 0; i < array_length(currentlySaying); i++) {
		text_length[i] = string_length(currentlySaying[i]);
	}

}

width = 500;
height = 75;

//center

x = 756 / 2 - 150;
y = 780;
 
//dr menu background
var textSpeed = 0.15
if (draw_char < text_length[menu_level]) {
	if (string_length(currentlySaying) > draw_char + 2) {
		if (string_char_at(currentlySaying, draw_char + 2) == "," || string_char_at(currentlySaying, draw_char + 2) == "." || string_char_at(currentlySaying, draw_char + 2) == "?") {
			textSpeed = textSpeed * 0.1;
		}
		if (string_char_at(currentlySaying, draw_char + 2) == " ") {
			audio_play_sound(asset_get_index("deepCalling" + string(irandom_range(1,4))), 2 ,false, global.volume_setting);
		}
	}
	draw_char += textSpeed;

} else {
	if (once == false) {
		alarm[0] = 150;
		once = true;
	}
}

draw_sprite_ext(sprite_index, image_index, x, y, width/sprite_width*3, height/sprite_height*3, 0, c_white, 1);

	var _c = c_white;

	var _drawtext = string_copy(currentlySaying[menu_level], 1, draw_char);
	draw_text_color(x+op_border, y+op_border + op_space*menu_level, _drawtext, _c, _c, _c, _c, 1 );

	for (var i = 0; i < menu_level; i++) {
		draw_text_color(x+op_border, y+op_border + op_space*i, currentlySaying[i], _c, _c, _c, _c, 1 );
	}		



