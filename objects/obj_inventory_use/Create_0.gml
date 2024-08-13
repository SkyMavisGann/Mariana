
width = 80;
height = 88;


op_border = 24;
op_space = 44;

pos = 0;

//pause menu
option[0, 0] = "Use";
option[0, 1] = "Drop";
option[0, 2] = "<-"
option[0, 3] = "->"
option[0, 4] = "Back"



op_length = 0;
menu_level = 0;

//function deleteItem(posneg) {
//	var j = 0
//	j++;
//obj_inventory.pos = obj_inventory.pos + posneg;
//}

buttons = [];

function dropItem(obje) {
	var offset = obj_diver.image_xscale * 60;
	with(instance_create_layer(obj_diver.x + offset, obj_diver.y, "player_layer", obje)) {
		randDir = 0;
		randDir2 = 0;
	}
	array_delete(global.inventory, obj_inventory.pos, 1); 
	
}
