container = [convertTo("name", obj_Scrap), convertTo("name", obj_Pearl), convertTo("name", obj_Air_Tank)];
//chest duplicating catachall
if (place_meeting(x,y, obj_chest)) {
	instance_destroy();
}
