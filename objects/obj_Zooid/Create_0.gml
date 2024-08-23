squidId = -1;
scaledValue = 1.5;
//latest one is going to be current tentacle, second to last is one right above you
image_index = irandom_range(0, sprite_get_number(sprite_index));

maxHP = 1;
HP = maxHP;

flashAlpha = 0;
flashColor = make_color_rgb(230, 150, 64);
soundOnce = true;