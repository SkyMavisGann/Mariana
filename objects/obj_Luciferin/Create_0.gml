
image_xscale = 1.5;
image_yscale = 1.5;
randDir = irandom_range(-2,2);
randDir2 = irandom_range(1,2);

despawn = 52000;
pickupability = false;

if (!array_contains(obj_settings.achivements, "Found light")) {
	array_push(obj_settings.achivements, "Found light");
}
description = "A glowing goo. Glows alot actually. If you keep some out you might be able to see in the dark. Can be equipped.";