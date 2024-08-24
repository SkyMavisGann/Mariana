frame += spe;
if (frame > 360) {
	frame = 0;
}
var scalex = dcos(frame) + scaledx + 1;
var scaley = dcos(frame) + scaledy + 1;
image_xscale = scalex;
image_yscale = scaley;