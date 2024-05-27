direction = point_direction(stX, stY, aimX, aimY);
image_alpha = 1;

z = -abs(abs(aimX-stX) / lengthdir_x(spd, direction)) * zspd / 2;
if is_nan(z)
	z = 0;