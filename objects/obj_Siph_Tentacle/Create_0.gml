stemBody = [];

flashAlpha = 0;
flashColor = c_white;


scale = 1.5;
image_xscale = scale;
image_yscale = scale;
length = sprite_width - (3 * scale);




default_swim_speed = 10;
swim_speed = default_swim_speed;
rotation_speed = 1;

EEx = x;
EEy = y;

numberOfSegments = 10;
for  (var i = 0; i < numberOfSegments; i++) {
	array_push(stemBody, instance_create_layer(x, y, "behind_diver", obj_siph_seg_player));
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