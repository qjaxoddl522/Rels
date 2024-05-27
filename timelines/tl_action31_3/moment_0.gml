for(var i=0; i<array_length(players); ++i){
	viewX[i] = i ? instance_nearest(0, 0, obj_dead).x : instance_furthest(0, 0, obj_dead).x;
	viewY[i] = i ? instance_nearest(0, 0, obj_dead).y : instance_furthest(0, 0, obj_dead).y;
}