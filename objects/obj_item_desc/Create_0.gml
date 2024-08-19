width = 400;
height = 88;


op_border = 34;
op_space = 64;

pos = 0;

op_length = 0;
menu_level = 0;
textToDisplay = [""];
lengthToDisplay = 1200;
itemName = global.inventory[obj_inventory.pos];
object = convertTo("obj", itemName);
var tempObj = instance_create_layer(-100, 100, "player_layer", object);
if (variable_instance_exists(tempObj, "description")) {
	textToDisplay = splitTextLength(tempObj.description, lengthToDisplay);
}

text_length[0] = string_length(textToDisplay[0]);
draw_char = 0;


setup = false;

instance_destroy(tempObj);
