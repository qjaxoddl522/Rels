/// @description 그림자 그리기
if(!surface_exists(shadowSurface)){
	shadowSurface = surface_create(room_width, room_height);
}

surface_set_target(shadowSurface);
draw_clear_alpha(c_black,0);

var sx = skewX;
var sy = shadowHeight;

gpu_set_fog(true, c_black, 0, 1);
with(objPa_player){
	if visible{
		draw_sprite_pos(sprite_index, image_index, 
			x-(sprite_width/2)-sx,
			y-sy, 
			x+(sprite_width/2)-sx, 
			y-sy, 
			x+(sprite_width/2), 
			y, 
			x-(sprite_width/2), 
			y, 
			1);
	}
}
with(objPa_enemy){
	if gridSight[# x div TILE_W, y div TILE_H] = 1{
		draw_sprite_pos(sprite_index, image_index, 
			x-(sprite_width/2)-sx,
			y-sy, 
			x+(sprite_width/2)-sx, 
			y-sy, 
			x+(sprite_width/2), 
			y, 
			x-(sprite_width/2), 
			y, 
			1);
	}
}
gpu_set_fog(false, c_white, 0, 0);

surface_reset_target();

draw_set_alpha(0.3);
draw_surface(shadowSurface, 0, 0);
draw_set_alpha(1);