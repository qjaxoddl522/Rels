/// @description 그리드 시야 입력
//플레이어 시야
ds_grid_clear(gridSight, 0);
for(var i=0; i<array_length(players); ++i){
	if instance_exists(players[i]){
		pLoc[i] = [players[i].x div TILE_W, players[i].y div TILE_H];
		
		var px = pLoc[i][0], py = pLoc[i][1];
		for(var _x=0; _x<map_w; ++_x){
			for(var _y=0; _y<map_h; ++_y){
				if abs(px-_x)+abs(py-_y)<=pSightRange[i]{
					var cen_x = _x*TILE_W+(TILE_W/2), cen_y = _y*TILE_H+(TILE_H/2);
					if !collision_line(cen_x, cen_y, players[i].x, players[i].y, obj_wall, true, false){
						//시야 범위 내에 있고 [벽에 가리지 않거나 벽이라면] 1로 변경
						gridSight[# _x, _y] = 1;
					}else if instance_position(cen_x, cen_y, obj_wall) != noone{ //벽너머 벽 확인
						with(instance_position(cen_x, cen_y, obj_wall)){
							if !collision_line(cen_x, cen_y, players[i].x, players[i].y, obj_wall, true, true){
								gridSight[# _x, _y] = 1;
							}
						}
					}
				}
			}	
		}
	}
}
with(obj_clearSight){//투명 시야
	gridSight[# x div TILE_W, y div TILE_H] = 1;
}

ds_grid_clear(gridEnemySight, 0);
if instance_exists(objPa_enemy){
	with(objPa_enemy){
		for(var _x=0; _x<map_w; ++_x){
			for(var _y=0; _y<map_h; ++_y){
				if abs(myLoc[0]-_x)+abs(myLoc[1]-_y)<=sightRange{
					var cen_x = _x*TILE_W+(TILE_W/2), cen_y = _y*TILE_H+(TILE_H/2);
					if !collision_line(cen_x, cen_y, x, y, obj_wall, true, false){
						//시야 범위 내에 있고 [벽에 가리지 않으면] 1로 변경
						gridEnemySight[# _x, _y] = 1;
					}
				}
			}	
		}
	}
}
pSeeing[0] = gridEnemySight[# pLoc[0][0], pLoc[0][1]] == 1;
pSeeing[1] = gridEnemySight[# pLoc[1][0], pLoc[1][1]] == 1;