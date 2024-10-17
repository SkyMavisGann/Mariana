container = [convertTo("name", obj_Soggy_Sandwich), convertTo("name", obj_Wet_Burrito)];
//chest duplicating catachall
if (place_meeting(x,y, obj_chest)) {
	instance_destroy();
}
