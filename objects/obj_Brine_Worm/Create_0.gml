


stemBody = [];

flashAlpha = 0;
flashColor = c_white;

HideTime = -21;
HideDirection = 1;
HideOnce = false;
scale = 4;
image_xscale = scale;
image_yscale = scale;
length = sprite_width - (3 * scale);

damage = 2;
laidEggs = false;
layingEggsAge = 0;

switchDirTime = 200;

default_swim_speed = 4;
swim_speed = default_swim_speed;
rotation_speed = 2;

randomTimer = 0;
maxRandomTimer = 50;

EEx = obj_diver.x;
EEy = obj_diver.y;

numberOfSegments = irandom_range(15, 17);
for  (var i = 0; i < numberOfSegments; i++) {
	array_push(stemBody, instance_create_layer(x, y, "behind_diver", obj_Brine_Worm_Segment));
	stemBody[i].squidId = id;
	stemBody[0].x = x + (length);
	stemBody[0].y = y + 0;
	with (stemBody[i]) {
		numberOfTentacles = squidId.numberOfSegments;
		myNumber = i;
		allTentaclesAbove = squidId.stemBody;
		if (myNumber != 0) {
			var upperTent = allTentaclesAbove[myNumber - 1]; 
			var TentacleX = upperTent.x + (length * dcos(upperTent.image_angle));
			var TentacleY = upperTent.y + (length * dsin(upperTent.image_angle));
			x = TentacleX;
			y = TentacleY;
		}
	}
}

function collision() {

	// You can write your code in this editor
	var speed_x = x - xprevious;
	var speed_y = y - yprevious;

	var spe = sqrt(sqr(speed_x) + sqr(speed_y));

	// Get the Y speed of the fish by subtracting the current Y position
	// from the previous Y position

	var _div = 1;

	if ((place_meeting(x-spe, y, obj_collision_parent))) {
		x = x + spe/_div
	}
	if ((place_meeting(x+spe, y, obj_collision_parent))) {
		x = x - spe/_div;
	}

	if (place_meeting(x, y+spe, obj_collision_parent)) {
		y = y - spe/_div;
	}
	if ((place_meeting(x, y-spe, obj_collision_parent))) {
		y = y + spe/_div;
	}
	
	if (place_meeting(x, y, obj_collision_parent)) {
		var nearBlock = instance_nearest(x, y, obj_collision_parent);
		move_towards_point(nearBlock.x, nearBlock.y, -1);
	}

}
	
audio_emitter = audio_emitter_create();

audio_emitter_falloff(audio_emitter, 50, 900, 2);


voicePitch = random_range(0.8, 1.1);
rando = irandom_range(1, 2);

