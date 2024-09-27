max_oxygen = 60;
if !variable_global_exists("oxygen") {
	global.oxygen = max_oxygen;
}

refilling = 0;
oxygen_time = 1240;
oxygen_timer = oxygen_time;

frame = 0;
scaled = 5;

curScale = 5;