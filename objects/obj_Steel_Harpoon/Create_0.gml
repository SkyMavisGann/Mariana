
image_xscale = 1;
image_yscale = 1;
randDir = irandom_range(-2,2);
randDir2 = irandom_range(1,2);

despawn = 52000;
pickupability = false;

sprite_index = convertTo("spr", object_get_name(object_index));
description = "A steel harpoon. Does 1.5 damage. Moderate range. Can be equipped."