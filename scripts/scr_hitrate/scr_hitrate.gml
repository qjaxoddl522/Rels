function scr_hitRate(range, aimId){
	var inRangeRate = 0.005, outRangeRate = 0.2; //사거리별 명중률 하락 비율
	var dis = abs(x div TILE_W-aimId.x div TILE_W)+abs(y div TILE_H-aimId.y div TILE_H);
	hitRate = collision_line(aimId.x, aimId.y, x, y, obj_wall, true, false) ? 0 : 1;
			
	if hitRate != 0{
		//거리에 따른 명중률 계산
		if range-dis >= 0
			repeat(min(dis, range)){hitRate *= 1-inRangeRate;}
		repeat(max(dis-range, 0)){hitRate *= 1-outRangeRate;}
			
		//엄폐물에 따른 명중률 계산
		var _list = ds_list_create();
		var _cons = collision_line_list(aimId.x, aimId.y, x, y, obj_construction, true, false, _list, false);
		if _cons>0{
			for (var i=0; i<_cons; ++i;){
				var _xdis = abs(_list[| i].x div TILE_W - aimId.x div TILE_W), _ydis = abs(_list[| i].y div TILE_H - aimId.y div TILE_H);
				if  _xdis <= 1  and _ydis <= 1{
					hitRate *= 1-_list[| i].coverRate;
					break;
				}
			}
		}
		ds_list_destroy(_list);
		_list = -1;
	}if object_index == obj_player1 or object_index == obj_player2{
		return clamp(hitRate*(weaponPrice[player][1][1] == 0 ? 1.1 : 1), 0, 1);
	}else return clamp(hitRate, 0, 1);
}