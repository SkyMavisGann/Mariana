var tempSpeed = rotationSpeed;
var gearUOO = true;
var shaftUOO = true;
var leverUOO = true;
if (needsLevered && (array_contains(obj_settings.achivements, "Levered") == -1)) {
	leverUOO = false;
}
if (needsShafted && (array_contains(obj_settings.achivements, "GearShafted") == -1)) {
	shaftUOO = false;
}
if (needsGeared && (array_contains(obj_settings.achivements, "Geared") == -1)) {
	gearUOO = false;
}
if (!gearUOO || !shaftUOO || !leverUOO) {
	tempSpeed = 0;
}
if (tempSpeed == 0 && gearUOO && shaftUOO && leverUOO) {
	tempSpeed = rotationSpeed;
}

image_angle += tempSpeed;
if (tempSpeed != 0 && playOnce) {
	audio_play_sound_at(sfx_gear, x, y, 0, 50, 600, 3, true,2, global.volume_setting, 0, abs(tempSpeed));
	playOnce = false;
}
