var spaceBetween = 30;
var timeDown = 0.01;
draw_set_font(global.font_main);
if (array_length(itemsDisplayCurrently) != 0) {
	for (var i = 0; i < array_length(itemsDisplayCurrently); ++i) {
		
		var sprite = convertTo("spr", itemsDisplayCurrently[i]);
		var offset = (((((sprite_get_width(sprite) * 3)/2) + spaceBetween) * (i + 1)));
		var DisplayX = view_get_wport(view_camera[0]) - offset;
		var DisplayY = (0 + (sprite_get_height(sprite) * 3) / 2) + spaceBetween;
		draw_sprite_ext(sprite, 0, DisplayX, DisplayY , 5, 5, 0, c_white, itemsDisplayTime[i]);
		draw_text_transformed(DisplayX, DisplayY + 40, "+", 1, 1, 0);
		itemsDisplayTime[i] -= timeDown;
		if (itemsDisplayTime[i] <= 0) {
			array_delete(itemsDisplayCurrently, i, 1);
			array_delete(itemsDisplayTime, i, 1);
		}
	}
}