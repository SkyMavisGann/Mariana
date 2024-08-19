
image_xscale = 1.5;
image_yscale = 1.5;
randDir = irandom_range(-2,2);
randDir2 = irandom_range(1,2);

despawn = 52000;
pickupability = false;

sprite_index = convertTo("spr", object_get_name(object_index));
description = "A yellow key. If you try to open the right door with this key in your inventory it will open.";