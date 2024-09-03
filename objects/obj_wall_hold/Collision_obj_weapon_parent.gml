if obj_diver.attacking = 1 {
	destroy();
}
if (obj_diver.attacking == 1) {
	if (obj_diver.aTimer > 56) {
		obj_diver.DiverCollidedInAttack = true;
	}
}

if (obj_diver.attacking == 1) {
	if (obj_diver.aTimer > 36 && obj_diver.aTimer < 38) {
		obj_diver.DiverCollidedInAttack = true;
	}
}