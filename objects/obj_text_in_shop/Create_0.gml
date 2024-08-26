width = 400;
height = 88;


op_border = 34;
op_space = 64;

pos = 0;

op_length = 0;
menu_level = 0;
textToDisplay = [""];
lengthToDisplay = 850;
itemName = obj_shop.option[0, obj_shop.pos];
object = convertTo("obj", itemName);
var tempObj = instance_create_layer(-100, 100, "player_layer", object);
if (variable_instance_exists(tempObj, "shopDescription")) {
	textToDisplay = splitTextLength(tempObj.shopDescription, lengthToDisplay);
}

text_length[0] = string_length(textToDisplay[0]);
draw_char = 0;


setup = false;

instance_destroy(tempObj);
