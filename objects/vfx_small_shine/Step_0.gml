frame += spe;
if (frame > 360) {
	frame = 0;
}
var scalex = (dcos(frame) * 0.25) + scaledx;
var scaley = (dcos(frame) * 0.25) + scaledy;
image_xscale = scalex;
image_yscale = scaley;