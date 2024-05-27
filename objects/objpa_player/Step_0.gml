/// @description 스프라이트 및 상태 관할
if visible and image_alpha > 0{
	//반동잡기
	if isAttacking{
		weaponImg -= 1;
		weaponImg = max(0, weaponImg);
		shotX -= 1/3;
		shotX = max(0, shotX);
		shotRot -= 1;
		shotRot = max(0, shotRot);
		if shotX <= 0{
			isAttacking = false;
			scr_playerDelay(weaponStat[pWeapon[player][0]][3]);
		}
	}
	if Lock{
		//커서 조종
		if keyboard_check_pressed(pRight[player]) or keyboard_check_pressed(pLeft[player]) or keyboard_check_pressed(pDown[player]) or keyboard_check_pressed(pUp[player]){
			cursor.x += TILE_W*(keyboard_check_pressed(pRight[player])-keyboard_check_pressed(pLeft[player]));
			cursor.y += TILE_H*(keyboard_check_pressed(pDown[player])-keyboard_check_pressed(pUp[player]));
			cursorScroll = false;
			pressedKey = keyboard_lastkey;
			alarm[1] = 0.5*game_get_speed(gamespeed_fps); //연속적 이동 진입 시간
		}
		if keyboard_check_released(pressedKey)
			cursorScroll = false;
		if cursorScroll and cursorScrollDelay <= 0{
			switch(pressedKey){
				case pRight[player]:cursor.x += TILE_W; break;
				case pLeft[player]:cursor.x -= TILE_W; break;
				case pDown[player]:cursor.y += TILE_H; break;
				case pUp[player]:cursor.y -= TILE_H; break;
			}
			cursorScrollDelay = 0.1*game_get_speed(gamespeed_fps); //연속적 이동 간격 시간
		}
		cursorScrollDelay -= cursorScrollDelay>0 ? 1 : 0;
		cursor.x = clamp(cursor.x, TILE_W/2, room_width-TILE_W/2);
		cursor.y = clamp(cursor.y, TILE_H/2, room_height-TILE_H/2);

		//path 생성
		if isReady{
			path_end();
			path_clear_points(path);
			mp_grid_clear_all(mpGridMap);
			mp_grid_add_instances(mpGridMap, obj_wall, true);
			mp_grid_add_instances(mpGridMap, obj_construction, true);
			pathReady = mp_grid_path(mpGridMap, path, x, y, cursor.x, cursor.y, false); //이동 가능한 경로인지 확인
			path_delete(path_real);
			path_real = path_duplicate(path);
			for(var i=path_get_number(path_real)-1; i>pMoveDis[player]; --i) //초과 경로 삭제
				path_delete_point(path_real, i);
		}

		//이동 결정
		if keyboard_check_released(pButton1[player]){
			if cursorReady{
				var _x = path_get_point_x(path, path_get_number(path_real)-1), _y = path_get_point_y(path, path_get_number(path_real)-1);
				var _ge = gridEntity[# _x div TILE_W, _y div TILE_H];
				if  _ge == -1{
					scr_gridEntity_refresh(x, y, _x, _y, player); //엔티티 그리드 갱신
					path_start(path_real, 2, path_action_stop, true);
					isReady = false;
					isMoving = true;
					behavior = 0;
				} else if _ge == abs(player-1){
					scr_systemMessage(player, "아군이 자리를 선점했습니다!");
				} else if _ge == 2{
					scr_systemMessage(player, "적이 자리를 선점했습니다!");
				}
			}
		}

		//path 이동 동안 경로 삭제
		if isMoving{
			for(var i=1; i<path_get_number(path); ++i){
				var _x = path_get_point_x(path, i-1), _y = path_get_point_y(path, i-1);
				if (x > _x-TILE_W/2) and (y > _y-TILE_W/2) and (x < _x+TILE_W/2) and (y < _y+TILE_W/2){
					drawing = i;
				}
			}
		}

		//path 종료
		if path_position == 1 and isMoving{
			path_end();
			path_clear_points(path);
			drawing = 1;
			scr_playerDelay(delay.playerMove); //이동 후딜레이
			isMoving = false;
		}

		//공격 조준 및 발사
		if isReady{
			if instance_exists(objPa_enemy){
				var cx = cursor.x div TILE_W, cy = cursor.y div TILE_H;
				var nearEnemy = instance_nearest(cursor.x, cursor.y, objPa_enemy);
				if gridSight[# cx, cy] == 1 and (abs(nearEnemy.x-cursor.x) <= TILE_W/2 and abs(nearEnemy.y-cursor.y) <= TILE_H/2){
					aimId = nearEnemy;
				}else aimId = noone;
			}else aimId = noone;
		
			//발사
			if keyboard_check_released(pButton1[player]){
				if ammo > 0{
					event_user(0); //공격
				} else{ //재장전
					scr_playerReload();
				}
			}
			//수동 재장전
			if keyboard_check(pButton1[player]){
				reloadTimer += 1;
				if reloadTimer >= 0.5*game_get_speed(gamespeed_fps){
					if ammo < ammoMax
						scr_playerReload();
					else{
						scr_systemMessage(player, "이미 총알이 가득 차 있습니다!");
						reloadTimer = 0;
					}
					//튜토리얼
					if instance_exists(obj_missionManager12) and obj_missionManager12.condition == 5{
						obj_missionManager12.reload[player] = true;
					}
				}
			}
		}
		if keyboard_check_released(pButton1[player]){
			reloadTimer = 0;
		}
	
		//스프라이트 변경
		if isMoving
			sprite_index = asset_get_index("spr_player"+string(player+1)+"Move");
		else
			sprite_index = asset_get_index("spr_player"+string(player+1)+"Idle");
		dir = point_direction(x, y, cursor.x, cursor.y);
		if dir > 270 or dir < 90
			image_xscale = 1;
		if dir > 90 and dir < 270
			image_xscale = -1;

		//커서 스프라이트 변경
		cursorReady = isReady and pathReady and aimId == noone and (!cursorOnEntity or gridSight[# cursor.x div TILE_W, cursor.y div TILE_H] == 0);
		if cursorReady
			cursor.image_index = 0;
		else
			cursor.image_index = 1;
	}
}

//사망
if pHealth[player]<=0 and visible{
	var ef = instance_create_depth(x, y, -99, obj_shotEffect);
	ef.sprite_index = spr_summon;
	dead[player] = 1;
	visible = false;
	cursor.visible = false;
}