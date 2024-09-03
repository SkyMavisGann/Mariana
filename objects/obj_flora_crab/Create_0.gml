flashAlpha = 0;
flashColor = c_white;

scale = 2;
image_xscale = scale;
image_yscale = scale;

maxHP = 1;
HP = maxHP;
damage = 1;
age = 0;
laidEggs = false;
layingEggsAge = 0;


default_swim_speed = (1.5);
swim_speed = default_swim_speed;

fallSpeed = (swim_speed+0.5);

maxInFrames = 80;
InFrames = 0 ;


rightArmRotation = 0;
leftArmRotation = 0;

rightArm = instance_create_layer(x, y, "behind_diver", obj_flora_crab_arm);
leftArm = instance_create_layer(x, y, "behind_diver", obj_flora_crab_arm);

rightArm.crab = id;
with (rightArm) {
	scale = 2;
	image_xscale = -scale;
	image_yscale = scale;
	
}
leftArm.crab = id;
with (leftArm) {
	scale = 2;
	image_xscale = scale;
	image_yscale = scale;
	
}

subimg = 0;
randomNum = irandom_range(120, 200);
needsToStop = false;

needsToMoveLeftRight = -1;

rando = irandom_range(1, 2);	