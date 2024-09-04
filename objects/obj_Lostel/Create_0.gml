flashAlpha = 0;
flashColor = c_white;

scale = 2;
image_xscale = scale;
image_yscale = scale;

maxHP = 2;
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

crystal = instance_create_depth(x, y, depth-1, obj_Lostel_Crystal);
crystal.lostelId = id;

randomNum = irandom_range(120, 200);
needsToStop = false;

needsToMoveLeftRight = -1;

rando = irandom_range(1, 2);	
canAttack = true;