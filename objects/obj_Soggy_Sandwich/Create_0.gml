image_xscale = 1.5;
image_yscale = 1.5;
randDir = irandom_range(-2,2);
randDir2 = irandom_range(1,2);

despawn = 52000;
pickupability = false;

sprite_index = convertTo("spr", object_get_name(object_index));
description = "A sandwich with ham, cheese, tomato, and lettuce. Its sopping wet but the bread is still intact. Can be used once to restore 1 health."
shopDescription = "The greatest invention ever. My sandwiches are literally the best sandwiches in the entire Trench! You're basically robbing me with these prices."