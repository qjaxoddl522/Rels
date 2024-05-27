/// @description 날아감
image_angle = direction;
x += lengthdir_x(spd, direction);
y += lengthdir_y(spd, direction);

if point_distance(x, y, aimX, aimY) < spd/2 and !passed{
	passed = true;
	scr_playerDamage(aimId, damage);
	if damage != 0
		instance_destroy();
}

if position_meeting(x, y, obj_wall) and passed{
	instance_destroy();
}