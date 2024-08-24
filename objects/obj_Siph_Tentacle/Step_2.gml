if (instance_exists(obj_diver)) {
		x = obj_diver.x;
		y = obj_diver.y;
		EEx = x;
		EEy = y;
			for (var i = array_length(stemBody) - 2; i > 0; --i) {
				var lowerTent = stemBody[i + 1];
				with (stemBody[i]) {
					

					var pd = point_direction(x, y, lowerTent.x, lowerTent.y);
					var dd = angle_difference(image_angle, pd);
				
					image_angle = pd;
					//var pd = upperTent.image_angle;
					//var dd = angle_difference(image_angle,pd);

					//image_angle -= min(abs(dd), 1) * sign(dd);
					var goalx = lowerTent.x - (length * dsin(image_angle + 90));
					var goaly = lowerTent.y - (length * dcos(image_angle + 90));
					x = goalx;
					y = goaly;
					
				
				}
			}
			for (var i = 1; i < array_length(stemBody); ++i) {
				with (stemBody[i]) {
					var upperTent = allTentaclesAbove[myNumber - 1]; 
					// get the direction towards the upper tentacle (if you were a squid and your tentacles were hanging down)
					var pd = point_direction(upperTent.x, upperTent.y, x, y);
					// get difference between which way the upper tentacle is actually facing and the direction it should be
					var dd = angle_difference(upperTent.image_angle,pd);
				
					upperTent.image_angle = pd;
					//var pd = upperTent.image_angle;
					//var dd = angle_difference(image_angle,pd);

					//image_angle -= min(abs(dd), 1) * sign(dd);
					var goalx = upperTent.x + (length * dsin(upperTent.image_angle + 90));
					var goaly = upperTent.y + (length * dcos(upperTent.image_angle + 90));
					x = goalx;
					y = goaly;
				
				}
			}
		
}
//find the position you need to be at so your rotated end can be touching another specified point
function moveTailToPoint(obj, px, py, length, angle) {
	var LowerTentx = px - (length * dsin(angle + 90));
	var LowerTenty = py - (length * dcos(angle + 90))
	obj.x = LowerTentx;
	obj.y = LowerTenty;
}