# Mariana
Mariana is an underwater exploration and metroidvania indie game. In this game you are dropped into an unknown trench to explore. You will find fantastical creatures and rare artifacts. Fight bosses and mini-bosses in order to dive as deep as possible.

# features
<body>
This is the map feature of the game. By buying an outdated map you can see where the bodies of "previous divers"(aka your bodies) with a sinoid glowing blue effect.
  
![d04da84d4cef8be029bf30e91e2d6a90](https://github.com/whitefangalive/Mariana/assets/49380278/58b8cc0a-6831-4b0b-b5c2-ff35f4d57cd9)

To do this I had to make a project of 11.2x scale from the map to the real room.


The most challanging part is if you died in another room. If you did I want the map to show the location of the doorway to that door. However if you died a few rooms over it will glow at the door that will lead you to the room next to the room you died.


Essentially it should lead you on a path to your body. Going door to door.


However this means I need to know the location of each room. To do this I named each room with the prefix of the previous room Ex.
```
"Room1_SideRoom1"
```
 where you are in SideRoom1 and Room1 is the previous room. 
 
 Doing this allows me to backtrace all the way to the room you respawn in and place a glow on the correct door.


<body>

This the Orsis squid on the second level of Mariana. Moving through its tentacles pushes them out of the way.

https://github.com/whitefangalive/Mariana/assets/49380278/023dc30a-ca31-4fa3-a009-ff2b3d0257ca


This feature works by having multiple sections of tentacle, each tentacle knows what number it is and who its parent tentacle is. The origin of the tentacle is at its top. So in order to calculate its position it must use cosine and sine of the angle of the tentacle above and multiple by its length. 
```
(sin(angle) = x/sprite_height) and (cos(angle) = y/sprite_height).
```

The only thing left to do is rotate the tentacle away from the player. However you want to do this bassed on the players speed, so in order to find which direction the player is moving as well as speed you can find 
```
x pos - previous x pos.
```

If no one is pushing a tentacle they slowly rotate back down to have an angle of 0.


This is a work in progress gamemaker game. The sole programmer and composer is Sky Mavis Gann however there are a few artists.


Sprite credit:
Phantom:
 - Diver
 - Ice fish
 - Boogley fish
 - Golden fish
 - Yerino boss
 - Shopkeeper Muro


All other sprites were drawn by Sky Mavis Gann.
