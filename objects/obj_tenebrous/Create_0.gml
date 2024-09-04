flashAlpha = 0;
flashColor = c_white;
bTimer = 0;
randX = irandom_range(-50,50);
randY = irandom_range(-50,50);
moving = 0;
charge_attack = 0;
hostile = true;

// You can write your code in this editor
image_xscale = 1;
image_yscale = 1;

maxHP = 2;
HP = maxHP;
maxInFrames = 80;
InFrames = 0 ;
damage = 1;
age = 0;
laidEggs = false;
layingEggsAge = 0;

switchDirTime = 200;
maxAge = 21000 + irandom_range(0, 150);

default_swim_speed = 2.5;
swim_speed = default_swim_speed;


path_ended = "false"; 
