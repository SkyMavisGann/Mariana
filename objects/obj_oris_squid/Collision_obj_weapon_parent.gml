 /// @description get attacked
// You can write your code in this editor
// Hurt ----------------------------------------Sprite Input
if obj_diver.attacking = 1 {
	if (flashAlpha = 0) {
		obj_diver.DiverCollidedInAttack = true;
		flashAlpha = 1;
		HP -= global.attack_damage;
	}
}

