flashAlpha = 0;
flashColor = c_white;
bTimer = 0;
randX = irandom_range(-50,50);
randY = irandom_range(-50,50);
moving = 0;
charge_attack = 0;
hostile = false;

// You can write your code in this editor
scale = 0.6;
image_xscale = scale;
image_yscale = scale;

if (distance_to_object(obj_yerino) > 600) {
	maxHP = 4;
} else {
	maxHP = 2;
}

HP = maxHP;
damage = 1;
age = 0;
laidEggs = false;
layingEggsAge = 0;

switchDirTime = 150;
maxAge = 25000 + irandom_range(0, 150);

default_swim_speed = (random(1.00) + 1.5);
swim_speed = default_swim_speed;

path_ended = "false"; 

needsToMoveLeftRight = -1;

getEggOnce = false;
range = 700;

getPosOnce = false;
diverx = 0;
divery = 0;