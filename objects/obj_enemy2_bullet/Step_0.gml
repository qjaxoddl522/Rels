/// @description 날아감
image_angle += rot;
z += zspd;
repeat(spd){
	x += lengthdir_x(1, direction);
	y += lengthdir_y(1, direction);
	if point_distance(x, y, aimX, aimY) <= spd+z{
		var p = instance_create_layer(aimX, aimY, "Main", obj_enemy2_poison);
		p.damage = damage;
		instance_destroy();
		break;
	}
}
y += z;