container = [convertTo("name", obj_Air_Tank), convertTo("name", obj_Soggy_Sandwich), convertTo("name", obj_Sopping_Wet_Bagel_Half)];
//chest duplicating catachall
if (place_meeting(x,y, obj_chest)) {
	instance_destroy();
}
