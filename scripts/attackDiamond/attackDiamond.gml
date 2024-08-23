// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function attackDiamond(){
swim_speed = swim_speed + 6;

		if (loop >= 1 && loop < 60) {
			sprite_index = spr_yerino_mouth_move;
			audio_play_sound_at(sfx_yerino1,x, y, 0, 100, 1200, 2, false, 1, global.volume_setting, 0, random_range(0.8, 1.2));
			move_towards_point(obj_diver.x,obj_diver.y+300, swim_speed);
		}
		if (loop >= 60 && loop < 120) {
			move_towards_point(obj_diver.x-300,obj_diver.y, swim_speed);
		}
		if (loop >= 120 && loop < 180) {
			move_towards_point(obj_diver.x,obj_diver.y-300, swim_speed);
		}
		if (loop >= 180 && loop < 240) {
			move_towards_point(obj_diver.x+300,obj_diver.y, swim_speed);
			sprite_index = spr_yerino;
		}
swim_speed = default_swim_speed;
}