var angleBetween = 90;
var hypot = sqrt(sqr(cx) + sqr(cy));
var TentacleX = ((hypot * 1) * dsin(angleBetween + image_angle));
var TentacleY = ((hypot * 1) * dcos(angleBetween + image_angle));
var xChange = TentacleX * 1;
var yChange = TentacleY * 1;
var xChanged = xChange / max(abs(xChange), abs(yChange)) * pushSpeed;
var yChanged = yChange / max(abs(xChange), abs(yChange)) * pushSpeed;


with (obj_dead_diver) { 
	if (place_meeting(x, y, obj_current)) {
		if (!place_meeting(x+xChanged,y+yChanged,obj_collision_parent)) {
			x += xChanged;
			y += yChanged;	
		}
	}
}