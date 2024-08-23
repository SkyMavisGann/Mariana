flashAlpha = 0;
flashColor = c_white;

scale = 3;
image_xscale = scale;
image_yscale = scale;

maxHP = 7;
HP = maxHP;
damage = 1;

default_swim_speed = (3.9);
swim_speed = default_swim_speed;

musicStart = false;


onceJump = false;

fallSpeed = (swim_speed+0.5);

maxInFrames = 80;
InFrames = 0 ;


rightArmRotation = 0;
leftArmRotation = 0;

rightArm = instance_create_layer(x, y, "behind_diver", obj_crabioli_right_arm);
leftArm = instance_create_layer(x, y, "behind_diver", obj_crabioli_right_arm);

armSprite = spr_crabioli_right_arm;

afterGrabbingWait = 0;

subimg = 0;
age = 0;
rando = irandom_range(1, 2);	