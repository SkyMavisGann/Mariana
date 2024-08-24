image_xscale = 1.5;
image_yscale = 1.5;
randDir = irandom_range(-2,2);
randDir2 = irandom_range(1,2);

despawn = 52000;
pickupability = false;

sprite_index = convertTo("spr", object_get_name(object_index));
description = "A delicious looking half of a bagel, its covered in cream cheese(Bet you're glad thats not in the name). Can be used once to restore 4 healh."