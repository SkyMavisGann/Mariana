container = [asset_get_index("obj_Soggy_Sandwich"), asset_get_index("obj_Soggy_Sandwich")];
//chest duplicating catachall
if (place_meeting(x,y, obj_chest)) {
	instance_destroy();
}
