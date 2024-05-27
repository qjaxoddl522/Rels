/// @description 이동 및 튕김
if spd>0{
	if !place_meeting(x+lengthdir_x(spd, dir), y, obj_wall) and !place_meeting(x+lengthdir_x(spd, dir), y, obj_construction){
		x += lengthdir_x(spd, dir);
	}
	if !place_meeting(x, y+lengthdir_y(spd, dir), obj_wall) and !place_meeting(x, y+lengthdir_y(spd, dir), obj_construction){
		y += lengthdir_y(spd, dir);
	}
}else{x = round(x); y = round(y);}

spd = max(0, spd-0.05);

if sprite_index == spr_deadbody
	image_blend = c_white;