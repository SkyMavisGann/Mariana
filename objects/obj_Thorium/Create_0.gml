image_xscale = 1.5;
image_yscale = 1.5;
randDir = irandom_range(-2,2);
randDir2 = irandom_range(1,2);

despawn = 52000;
pickupability = false;

if (!array_contains(obj_settings.achivements, "Found thorium")) {
	array_push(obj_settings.achivements, "Found thorium");
}
description = "A nicely cut black rock. It glows even in the the light."