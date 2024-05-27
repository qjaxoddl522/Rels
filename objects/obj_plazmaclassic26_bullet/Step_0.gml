/// @description 이동 및 데미지
image_angle = direction;
x += lengthdir_x(spd, direction);
y += lengthdir_y(spd, direction);

if point_distance(x, y, aimX, aimY) < spd/2 and !passed{
	passed = true;
	if instance_exists(aimId){scr_damage(orderPlayer, aimId, damage, direction);}
	if damage != 0{
		scr_effect(aimX, aimY, spr_PlazmaClassic26_effect);
		instance_destroy();
	}
}

if position_meeting(x, y, obj_wall) and passed{
	instance_destroy();
}