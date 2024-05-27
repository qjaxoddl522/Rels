e = instance_create_layer(400, 16+96, "Main", obj_enemy2);
e.stop = true;
instance_create_layer(e.x, e.y, "Main", obj_clearSight);
for(var i=0; i<array_length(players); ++i){
	viewX[i] = e.x;
	viewY[i] = e.y;
}