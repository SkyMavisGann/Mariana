container = [asset_get_index("obj_Air_Tank")];
//chest duplicating catachall
if (place_meeting(x,y, obj_chest)) {
	instance_destroy();
}
