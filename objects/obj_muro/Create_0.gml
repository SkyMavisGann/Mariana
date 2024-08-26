switch (obj_settings.timesEnteredSub) {
	case 1:
	say(["Welcome to the SS Sub Shop or the SSSS for short", "God I hate it here.", "Anyway you wanna buy something?"]);
	break;

	case 2:
	say(splitText("Hey, do I know you from somewhere? Were you at the 15th annual fish greasing competition?"));
	break;

	case 3:
	say(splitText("You know, there's a rumor going around that if you swim deep enough, you'll find a whole city down there."));
	break;


	case 4:
	say(splitText("You know what they say - the sea is full of mysteries. Like, for example, why does everything taste like salt down here?"));
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
	say(splitText("If more people make it down as far as I have, I'm definitely going to take this sub deeper. There's got to be something down there, something big. I can feel it in my bones. And if anyone's going to find it, it's going to be me, Muro, the greatest underwater merchant who ever lived!"));
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
	say(splitText("You know, sometimes I wonder if the new gods even know how to swim. They're always up in their fancy sky palaces, never getting their feet wet. But me, I've always been a hands-on kind of guy. That's how I ended up with this shop, you know? Inherited it from my father or some such. Although, it could have been his evil twin brother for all I know."));
	break;


	case 8:
	say(splitText("Can I interest you in this slightly used but still barely functional breathing apparatus?"));
	break;

	default:
	say(splitText("welcome back I guess."));
	break;
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


