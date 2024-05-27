/// @description 뷰 드로우
if !surface_exists(sight)
	sight = surface_create(room_width, room_height);
if !surface_exists(shadow)
	shadow = surface_create(room_width, room_height);

if ds_exists(gridSight, ds_type_grid){
	if instance_exists(players[0]) and instance_exists(players[1]){
		surface_set_target(sight);
		draw_clear_alpha(c_white, 0);
		draw_set_color(c_black);
		for(var _x=0; _x<map_w; ++_x){
			for(var _y=0; _y<map_h; ++_y){//사각형 그리기
				if gridSight[# _x, _y] == 1{
					draw_rectangle(_x*TILE_W, _y*TILE_H, (_x+1)*TILE_W-1, (_y+1)*TILE_H-1, false);
				}
			}
		}
		surface_reset_target();
		
		surface_set_target(shadow); //그림자를 검은색으로 채우고 시야만큼 지우기
		draw_clear_alpha(c_black, 1);
		gpu_set_blendmode(bm_subtract);
		draw_surface(sight, 0, 0);
		gpu_set_blendmode(bm_normal);
		surface_reset_target();
		
		//완성된 서피스 드로우
		draw_surface_ext(shadow, 0, 0, 1, 1, 0, c_white, 0.5);
	}
}