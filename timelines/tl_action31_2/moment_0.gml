aimPositionX[0] = 272;
aimPositionY[0] = 464;
aimPositionX[1] = 336;
aimPositionY[1] = 464;
for(var i=0; i<array_length(players); ++i){
	var p = instance_create_layer(aimPositionX[i], aimPositionY[i], "Main", obj_position);
	p.image_index = i;
	viewX[i] = aimPositionX[i];
	viewY[i] = aimPositionY[i];
}