/// @description 시야 계산, 스프라이트 변경 
event_inherited();

//사거리 계산(벽 막힘 고려)
ds_grid_clear(myRange, 0);
for(var _x=0; _x<map_w; ++_x){
	for(var _y=0; _y<map_h; ++_y){
		if abs(x div TILE_W-_x)+abs(y div TILE_H-_y)<=atRange{
			var cen_x = _x*TILE_W+(TILE_W/2), cen_y = _y*TILE_H+(TILE_H/2);
			if !collision_line(cen_x, cen_y, x, y, obj_wall, true, false) or
			position_meeting(cen_x, cen_y, obj_wall){
				//시야 범위 내에 있고 [벽에 가리지 않거나 벽이라면] 1로 변경
				myRange[# _x, _y] = 1;
			}
		}
	}	
}

//hp관리
if abs(hp-hp_mark) >= .5{
	hp_mark += (hp-hp_mark)/20;
}else{
	hp_mark = hp;
}
if hp<=0{
	scr_createDead(id, spr_die, image_xscale, lastDir, lastDam/10);
	if lastPlayer!=2{totalkill[lastPlayer] += 1;}
	gridEntity[# myLoc[0], myLoc[1]] = -1;
	instance_destroy();
}

//스프라이트 변경
if isMoving
	sprite_index = asset_get_index("spr_enemy"+string_char_at(object_get_name(object_index), 10)+"Move");
else
	sprite_index = asset_get_index("spr_enemy"+string_char_at(object_get_name(object_index), 10)+"Idle");

aimDir = aimPlayer != noone ? point_direction(x, y, players[aimPlayer].x, players[aimPlayer].y) : 0;

if aimDir > 270 or aimDir < 90
	image_xscale = 1;
if aimDir > 90 and aimDir < 270
	image_xscale = -1;