flashAlpha = 0;
flashColor = c_white;
bTimer = 0;
randX = irandom_range(-50,50);
randY = irandom_range(-50,50);
moving = 0;
charge_attack = 0;
hostile = true;

scale = 0.6;
image_xscale = scale;
image_yscale = scale;


HP = maxHP;
laidEggs = false;
layingEggsAge = 0;

switchDirTime = 150;
maxAge = 29000 + irandom_range(0, 150);

default_swim_speed = (random(1.00) + 0.3);
swim_speed = default_swim_speed;

needsToMoveLeftRight = -1;

range = 700;

getPosOnce = false;
diverx = 0;
divery = 0;
show_debug_message(x + y);

function getHurt(dam = global.attack_damage) {
		if (flashAlpha == 0) {
		flashAlpha = 1;
		HP -= dam;
		moving = 1;
		audio_play_sound_at(sfx_stab,x, y, 0, 100, 500, 2, false, 1, global.volume_setting, 0, random_range(1.1, 1.6));
		}
}