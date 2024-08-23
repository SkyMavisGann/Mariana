flashAlpha = 0;
flashColor = c_white;

damage = 1;

squidId = -1;
numberOfTentacles = -1;
myNumber = -1;
//latest one is going to be current tentacle, second to last is one right above you
allTentaclesAbove = [];


scale = 1.5;
image_xscale = scale;
image_yscale = scale;
length = sprite_width - 24 - (3 * scale);

zooid = instance_create_layer(x, y, "behind_diver", obj_Zooid);
zooid.squidId = id;