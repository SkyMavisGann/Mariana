if (!instance_exists(obj_text)) {
	switch (option[3, pos]) {
		case "Current":
			array_push(obj_settings.achivements, option[3, pos]);
			say(splitText("Yeah the current was my fault sorry, but hey if you buy the booster pack you can probably like boost through it or something. I wouldn't know its not like I set that current up for the sole purpose of luring people straight to the shop to sell them the only way through it or anything."));
		break;
		case "Muro":
			array_push(obj_settings.achivements, option[3, pos]);
			say(splitText("I'm a sea cowboy, Ya know, like a regular cowboy. Except I catch seacows on a seahorse. I guess this is more of my side gig. I keep the shop up for my dad."));
		break;
		case "Seeing in the dark":
			array_push(obj_settings.achivements, option[3, pos]);
			say(splitText("If you're having trouble seeing in the dark supposedly theres a luminous jellyfish around here somewhere."));
		break;
		case "Sub Shop":
			array_push(obj_settings.achivements, option[3, pos]);
			say(splitText("I inherited this shop from my father, or at least I think he was my father. It's hard to tell for sure when all I found was a skeleton in a submarine. But I like to think he'd be proud of me."));
		break;
		case "Trench":
			array_push(obj_settings.achivements, option[3, pos]);
			say(splitText("Yea this trench is pretty messed up. Though it has its benefits. For example the thorium crystals from all the god residue. Also all the buisness. Lots of people come to see what happened here."));
		break;
		case "Land":
			array_push(obj_settings.achivements, option[3, pos]);
			say(splitText("Yea I do miss the land when I'm down here, the sunlight, the lack of fish nibbling at your toes... But then again, if I lived on land, I'd have drop the word sea from my full title \"Sea Cowboy Merchant\". Speaking of which, how about this rare pearl I just found? It's said to bring good luck to anyone who owns it. Don't believe me? Why?"));
		break;
		case "New Gods":
			array_push(obj_settings.achivements, option[3, pos]);
			say(splitText("New gods? Eh, those bastards, with all the things they've done to the people I shudder to even call them gods."));
		break;
		case "Yerino":
			array_push(obj_settings.achivements, option[3, pos]);
			say(splitText("You know, there's a reason why they call the beast down here Yerino. It's because it'll rip yer insides right out ino . . Nevermind. I once saw a whole crew of divers go up against it and let's just say there wasn't much left of them after. I think its cause they made one crucial mistake. The Yerino is a deep sea creature, something about the water pressure being higher makes it faster. If you want to fight the Yerino, fight it as close to the surface as possible."));
		break;
		case "Sea Life":
			array_push(obj_settings.achivements, option[3, pos]);
			say(splitText("So, you wanna know more about life at sea? Well, let me tell you, it's not all sunshine and rainbows. There was this one time where I was stuck on a dinghy for three days with nothing but a pack of saltines and a rusty harmonica. I tell you what, I never wanna hear the tune 'Oh Susanna' again."));
		break;
		case "Depth":
			array_push(obj_settings.achivements, option[3, pos]);
			say(splitText("Nobody knows how far down this trench goes. Tons of people have gone down and never returned. Some say the trench goes all the way to the center of the Earth, but that's just crazy talk. The Ancient map takes a guess at its depth. But I swear i've heard things further down."));
		break;
		case "Creature Parts":
			array_push(obj_settings.achivements, option[3, pos]);
			say(splitText("Why am I trading for all these creature parts? I have my reasons. If you could I'd rather you get the parts from corpses instead of getting them fresh. Nobody knows if they feel pain or not. I hope they don't. Anyway would you stop yapping and buy something already?"));
		break;
		case "Thorium":
			array_push(obj_settings.achivements, option[3, pos]);
			say(splitText("Yea, its these black crystals. They glow? It powers my submarine so yea I trade for em. They form in dark areas."));
		break;
	}
}
var op_pos = 0;
for (var j = 0; j < 4; j++) {
	option[3, j] = "X";
}
for (var i = 0; i < array_length(topics) && op_pos < 4; i++) {
	if (array_contains(obj_settings.achivements, topics[i]) == -1) {
		option[3, op_pos] = topics[i];
		op_pos++;
	}
}