/// @description 뷰 이동
aimPositionX[0] = 112;
aimPositionY[0] = 432;
aimPositionX[1] = 304;
aimPositionY[1] = 432;
for(var i=0; i<array_length(players); ++i){
	var p = instance_create_layer(aimPositionX[i], aimPositionY[i], "Main", obj_position);
	p.image_index = i;
	viewX[i] = aimPositionX[i];
	viewY[i] = aimPositionY[i];
}