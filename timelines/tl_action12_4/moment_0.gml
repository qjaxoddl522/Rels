/// @description 뷰 이동
aimPositionX[0] = 144;
aimPositionY[0] = 688;
aimPositionX[1] = 272;
aimPositionY[1] = 688;
for(var i=0; i<array_length(players); ++i){
	var p = instance_create_layer(aimPositionX[i], aimPositionY[i], "Main", obj_position);
	p.image_index = i;
	viewX[i] = aimPositionX[i];
	viewY[i] = aimPositionY[i];
}