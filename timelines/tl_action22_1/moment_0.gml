aimPositionX[0] = 656;
aimPositionY[0] = 848;
aimPositionX[1] = 656;
aimPositionY[1] = 880;
for(var i=0; i<array_length(players); ++i){
	var p = instance_create_layer(aimPositionX[i], aimPositionY[i], "Main", obj_position);
	p.image_index = i;
	viewX[i] = aimPositionX[i];
	viewY[i] = aimPositionY[i];
}