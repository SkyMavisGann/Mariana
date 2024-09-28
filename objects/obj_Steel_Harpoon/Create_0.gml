
image_xscale = 1;
image_yscale = 1;
randDir = irandom_range(-2,2);
randDir2 = irandom_range(1,2);

despawn = 52000;
pickupability = false;

sprite_index = convertTo("spr", object_get_name(object_index));
description = "A steel harpoon. Does 1.5 damage. Moderate range. Can be equipped."
shopDescription = "This is easily 1.5x better then your standard ol' harpoon. Made of pure steel. Without this your basically fish food."
if (array_contains(global.bosses_beaten, "Crab") != -1) {
	 shopDescription = "This is easily 1.5x better then your standard ol' harpoon. Made of pure steel. Without this your basically fish food. I guess its not as strong as say, some sort of grotesque severed arm of some creature if you used that as a weapon."
}