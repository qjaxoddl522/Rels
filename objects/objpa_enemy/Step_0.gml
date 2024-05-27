/// @description 이동, 행동관리 등
//행동 관리
if (pSeeing[0] or pSeeing[1]){ //목표 플레이어 정하기
	if aimPlayer == noone
		action();
	if pSeeing[0] and pSeeing[1]{
		var pDis;
		for(var i=0; i<array_length(players); ++i){
			var p = path_add();
			mp_grid_clear_all(mpGridMap);
			mp_grid_add_instances(mpGridMap, obj_wall, true);
			mp_grid_add_instances(mpGridMap, obj_construction, true);
			pathReady = mp_grid_path(mpGridMap, p, x, y, (players[i].x div TILE_W)*TILE_W+TILE_W/2, (players[i].y div TILE_H)*TILE_H+TILE_H/2, false);
			if pathReady 
				pDis[i] = path_get_number(p)-1;
			else
				pDis[i] = -1;
			path_delete(p);
		}
		aimPlayer = pDis[0]<=pDis[1] ? 0 : 1;
	}else{
		aimPlayer = pSeeing[0] ? 0 : 1;
	}
	
	lastPx = players[aimPlayer].x div TILE_W * TILE_W+TILE_W/2;
	lastPy = players[aimPlayer].y div TILE_H * TILE_H+TILE_H/2;
}else{
	aimPlayer = noone;
}

//행동 결정
if isReady and !inAction and Lock{
	if aimPlayer != noone{
		if myRange[# pLoc[aimPlayer][0], pLoc[aimPlayer][1]] == 1{//내 공격 범위 안이면
			event_user(12); //자리잡기 좌표 지정
		}else{
			event_user(11); //목표 향해 움직이기
		}
		if behavior == state.setting and (moveX == x and moveY == y) {//자리잡고 공격 쏘기
			event_user(13);
		}
	}else{
		event_user(10); //방황 좌표 지정
	}
}

//이동
if (behavior==state.stray or behavior==state.move or behavior==state.setting) and Lock and !stop{
	if isReady and !(moveX == x and moveY == y) and !inAction{
		path_clear_points(path);
		mp_grid_clear_all(mpGridMap);
		mp_grid_add_instances(mpGridMap, obj_wall, true);
		mp_grid_add_instances(mpGridMap, obj_construction, true);
		pathReady = mp_grid_path(mpGridMap, path, x, y, (moveX div TILE_W)*TILE_W+TILE_W/2, (moveY div TILE_H)*TILE_H+TILE_H/2, false);
		for(var i=path_get_number(path)-1; i>moveDis; --i) //초과 경로 삭제
			path_delete_point(path, i);
		while(true){
			if gridEntity[# path_get_point_x(path, path_get_number(path)-1) div TILE_W, path_get_point_y(path, path_get_number(path)-1) div TILE_H] != -1 and path_get_number(path)-1>0{
				path_delete_point(path, path_get_number(path)-1);
			}else break;
		}
		if pathReady{
			scr_gridEntity_refresh(x, y, path_get_point_x(path, path_get_number(path)-1), path_get_point_y(path, path_get_number(path)-1), 2);
			myLoc = [path_get_point_x(path, path_get_number(path)-1) div TILE_W, path_get_point_y(path, path_get_number(path)-1) div TILE_H];
			if (path_get_number(path)-1 > 0) path_start(path, moveSpd, path_action_stop, true);
			isReady = false;
			isMoving = true;
		}//else show_debug_message(moveX);
	}
}

//이동 종료
if path_position == 1 and isMoving{
	path_end();
	path_clear_points(path);
	scr_enemyDelay(delay.enemyMove+random(.5)); //이동 후딜레이
	isMoving = false;
}