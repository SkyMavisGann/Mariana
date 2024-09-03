layer_enable_fx("shake", false);
if (global.beingYerinoChased) {
	
	alarm[0] = 230;
	say(["Hey welcome back ready to b . . . . . ", "Hey wheres my music? . . .", "You're kidding, thats the Yerino. You brought to me?! Thats it you NEED to leave!"]);
} else {
	switch (obj_settings.timesEnteredSub) {
		case 1:
		say(["Welcome to the SS Sub Shop or the SSSS for short", "Muro's the name.", "Anyway you wanna buy something?"]);
		break;

		case 2:
		say(splitText("Hey, do I know you from somewhere? Were you at the 15th annual fish greasing competition?"));
		break;

		case 3:
		say(splitText("Ya know if you keep swimmin' down you'd eventually reach the city. Obivously there's no one there anymore but I hear its pretty intact."));
		break;


		case 4:
		say(splitText("This trench really is full of mysteries. for example, why does everything taste like salt down here?"));
		break;

		case 4.5:
			var rand = irandom_range(0, 1);
			switch (rand) {
				case 0:
					say(splitText("If you're having trouble seeing in the dark supposedly theres a luminous jellyfish around here somewhere."));
				break;
				case 1:
					say(splitText("Theres a jellyfish cave somewhere above my submarine I just know it. I always smell their jelly. It's close but not too close."));
				break;
			}
		break;
	

		case 5:
		say(splitText("If more people make it down as far as I have, I'm definitely going to take this sub deeper. There's got to be something down there, something big."));
		break;



		case 5.5:
			var rand = irandom_range(0, 1);
			switch (rand) {
				case 0:
					say(splitText("I miss the old gods, powering my technology used to be so easy when they were in charge. Now with the new gods I need all this thorium. Luckily there's plenty of crystals hidden in dark areas."));
				break;
				case 1:
					say(splitText("Whatever you do, don’t go into the dark cave west of here. It’s super dangerous and full of monsters. It is not my secret thorium mining grounds. If you want to trade thorium, bring it from elsewhere."));
				break;
			}
		break;
		case 6:
		say(splitText("Oh you're back, speaking of things I don't like, have you ever heard of a sea cucumber? Disgusting little things if you ask me. And don't even get me started on seaweed."));
		break;


		case 7:
		say(splitText("With all the changes the new gods were making up there I might stay down here awhile. Not that they can't make changes to the sea again but it seems like less of a priority to them."));
		break;


		case 8:
		say(splitText("Can I interest you in this slightly used but still barely functional breathing apparatus?"));
		break;

		default:
		say(splitText("welcome back I guess."));
		break;
	}
}
if (room == room_shop_top) {
	destination = Room1;
} else {
	destination = Room2;
}
destinX = x;
destinY = y;

curLocation = room;

annoyance = 0;


