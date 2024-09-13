/// @description hurt and death
// You can write your code in this editor

//HURT AND DEATH FINAl -----------------------------SPRITE INPUT
if (sprite_index = spr_shark_hurt) {
sprite_index = spr_shark;
}

//REAL DEATH FINAL
if (sprite_index = spr_shark_die) {
	instance_create_layer(x, y, "player_layer", obj_Mauler_Fin);
	instance_destroy()
}