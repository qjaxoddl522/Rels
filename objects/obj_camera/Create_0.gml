/// @description 카메라 설정
depth = 1;
view_enabled = true;

for(var i=0; i<array_length(players); ++i){//뷰 관리
	view_visible[i] = true;

	cam[i] = camera_create_view(0, 0, (VIEW_W/2), VIEW_H);
	view_set_camera(i, cam[i]);

	view_set_xport(i, (VIEW_W/2)*i);
	view_set_yport(i, 0);
	view_set_wport(i, (VIEW_W/2));
	view_set_hport(i, VIEW_H);
	
	var _x = clamp(players[i].x-view_get_wport(i)/2, 0, room_width-camera_get_view_width(cam[i]));
	var _y = clamp(players[i].y-view_get_hport(i)/2-ui_h, 0, room_height-camera_get_view_height(cam[i]));
	camera_set_view_pos(cam[i], _x, _y);
}

//시야 관련
globalvar gridSight, pLoc;
gridSight = ds_grid_create(map_w, map_h); //0: 어둠 및 기타, 1: 시야
sight = -1;
shadow = -1;

for(var i=0; i<array_length(players); ++i)
	pLoc[i] = [players[i].x div TILE_W, players[i].y div TILE_H];

//뷰 흔들기
shake = false;
view = 0;
shakeX = 0;
shakeY = 0;
pow = 0;