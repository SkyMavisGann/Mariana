
frame += spe;
if (frame > 360) {
	frame = 0;
}
var scale = dcos(frame) + scaled;
image_xscale = scale + 1;
image_yscale = scale + 1;