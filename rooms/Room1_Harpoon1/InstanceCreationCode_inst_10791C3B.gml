container = [convertTo("name", obj_Starfish_place), convertTo("name", obj_Soggy_Sandwich), convertTo("name", obj_Air_Tank),convertTo("name",  obj_Soggy_Sandwich)];
//chest duplicating catachall
if (place_meeting(x,y, obj_chest)) {
	instance_destroy();
}
