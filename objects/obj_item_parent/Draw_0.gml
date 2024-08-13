draw_self();
if (instance_exists(obj_diver) && showName && (place_meeting(x,y,obj_diver))) {
	draw_set_font(global.font_main);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);

	var _c = c_red;
	draw_text_transformed_color(obj_diver.xprevious, obj_diver.yprevious-80, (convertTo("name", object_get_name(object_index))),0.5, 0.5, 0, _c, _c, _c, _c, obj_game.text_opacity * 4);
}