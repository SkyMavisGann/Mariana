if (obj_settings.Debug_Console) {
	debug = !debug

	if debug == true {
	show_debug_overlay(1);

	}

	if debug == false {
	show_debug_overlay(0);

	}
}