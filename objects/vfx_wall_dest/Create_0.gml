image_xscale = 0.2;
image_yscale = 0.2;
randDir = random_range(-2,2);
randDir2 = random_range(-2,2);

maxDespawn = 5;
despawn = maxDespawn;
audio_play_sound_at(sfx_stone,x, y, 0, 100, 500, 2, false, 1, global.volume_setting, 0, random_range(0.8, 1.1));
