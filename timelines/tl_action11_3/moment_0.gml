/// @description 뷰 이동
for(var i=0; i<array_length(players); ++i){
	aimPositionX[i] = obj_enemy0.x;
	aimPositionY[i] = obj_enemy0.y;
	var p = instance_create_layer(aimPositionX[i], aimPositionY[i], "Main", obj_position);
	p.image_index = 2;
	viewX[i] = aimPositionX[i];
	viewY[i] = aimPositionY[i];
}