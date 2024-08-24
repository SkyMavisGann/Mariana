// get input
key_w = keyboard_check_pressed(obj_settings.key_up);
key_s = keyboard_check_pressed(obj_settings.key_down);
key_accept = keyboard_check_pressed(obj_settings.key_select);

//storen number of otpions
op_length = array_length(option[menu_level]);

// enable clicking
for(var i = 0; i < array_length(buttons); i++) {
	var object = buttons[i];
	if (object.pressed == true) {
		pos = object.index;
		key_accept = true;
	}
}

//move through menu

	pos += key_s - key_w;

if pos >= op_length {pos = 0};
if pos < 0 {pos = op_length -1};

//using menu
if (!instance_exists(obj_text)) {
	
	if key_accept {
	audio_play_sound(sfx_select, 2, false, global.volume_setting);
		var _sml = menu_level;
		
		switch (menu_level) {
	
			//pause menu
			case 0:
				switch(pos) {
				//buy
				case 0:
					var buyingItem = string(obj_shop.option[0, obj_shop.pos]);
					var price = getPrices(buyingItem);
					
						var deepCopyPrice = [];
						array_copy(deepCopyPrice, 0, price, 0, array_length(price));
						var deepCopyInventory = [];
						array_copy(deepCopyInventory, 0, global.inventory, 0, array_length(global.inventory));
							for (var i = 0; i < array_length(price); i++) {
								for (var j = 0; j < array_length(deepCopyInventory); j++) {
									if (deepCopyPrice[0] == deepCopyInventory[j]) {
										show_debug_message(deepCopyPrice);
										show_debug_message(deepCopyInventory);
										array_delete(deepCopyPrice, 0, 1);
										array_delete(deepCopyInventory, j, 1);
										j = array_length(deepCopyInventory) + 2;
									}
								}
							}
						
							if (array_length(deepCopyPrice) == 0) {
								price = getPrices(obj_shop.option[0, obj_shop.pos]);
								for (var i = 0; i < array_length(price); i++) {
									for (var j = 0; j < array_length(global.inventory); j++) {
										if (global.inventory[j] == price[i]) {
											show_debug_message(global.inventory[j]);
											array_delete(global.inventory, j, 1);
											j = array_length(global.inventory) + 2;
										}
									}
								}
								
								if (!buyItem(obj_shop.option[0, obj_shop.pos])) {
									say(splitText("Oh, you don't have enough space. Just take the stuff back and come back with more space."));
									for (var i = 0; i < array_length(getPrices(obj_shop.option[0, obj_shop.pos])); ++i) {
										addItem(getPrices(obj_shop.option[0, obj_shop.pos])[i]);
									}
								} else {
									switch (buyingItem) {
										case ("Booster"):
											say(splitText("Enjoy your new "+ buyingItem + "!" + " Now you can boost through the current."));
										break;
										default:
											say(splitText("Enjoy your new "+ buyingItem + "!"));
										break;
									}
								}
							} else {
								obj_muro.annoyance++;
								var missingItem = string(deepCopyPrice[0]);
								var rand = 0
								if (obj_muro.annoyance < 7) {
									rand = irandom_range(0, 4);
								} else {
									rand = irandom_range(5, 7);
								}
								if (obj_muro.annoyance < 12) {
									switch (rand) {
										case 4:
											say(["Looks like you're missing " + articleChoose(missingItem) + missingItem + " Bucko."]);
										break;
										case 1:
											say(["The price says " + missingItem + " You don't have that."]);
										break;
										case 2:
											say(["You need to give me " + articleChoose(missingItem) + missingItem + "."]);
										break;
										case 3:
											say(["Are you trying to swindle me? I'm not going to give you " + articleChoose(buyingItem) + buyingItem + " without " + articleChoose(missingItem) + missingItem + "."]);
										break;
										case 0:
											say(splitText("I'll only trade my " + buyingItem + " if you give me all the items on price tag, you're missing " + articleChoose(missingItem) + missingItem + "."));
										break;
										case 5:
											say(splitText("Do you know how to read the price tag?"));
										break;
										case 6:
											say(splitText("You can't afford " + articleChoose(buyingItem) + buyingItem + " you are poor."));
										break;
										case 7:
											say(splitText("No " + missingItem + " no " + buyingItem + "."));
										break;
									}
								} else {
									say(["Would you stop that."]);
								}
								
							}
				break;
				//Drop
			    case 1: 
					with(obj_button) {
					}
					instance_destroy();	
				break;
				 }
			 break;
			}
		
		// set pos back
		if _sml != menu_level {pos = 0};
	
		//correct option length
		op_length = array_length(option[menu_level]);

	}
} else {
	instance_destroy();	
}
