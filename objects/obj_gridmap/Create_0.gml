/// @description 그리드 생성
globalvar gridEntity, gridEnemySight, mpGridMap, pSeeing;

gridEntity = ds_grid_create(map_w, map_h); //-1: 빈 공간, 01: 플레이어들, 2: 적
ds_grid_clear(gridEntity, -1);
with(obj_player1){gridEntity[# x div TILE_W, y div TILE_H] = 0;}
with(obj_player2){gridEntity[# x div TILE_W, y div TILE_H] = 1;}
with(objPa_enemy){gridEntity[# x div TILE_W, y div TILE_H] = 2;}

var wall = layer_tilemap_get_id("Wall"), const = layer_tilemap_get_id("Construction");
for(var _x=0; _x<map_w; ++_x){
	for(var _y=0; _y<map_h; ++_y){
		if tilemap_get(wall ,_x, _y) != 0
			instance_create_layer(_x*TILE_W, _y*TILE_H, "Main", obj_wall);
		var tile = tilemap_get(const ,_x, _y);
		if tile != 0{
			var c = instance_create_layer(_x*TILE_W, _y*TILE_H, "Main", obj_construction);
			//엄폐율 조정(기본값 0.3)
			if tile == 177
				c.coverRate = 0.4;
		}
	}
}

gridEnemySight = ds_grid_create(map_w, map_h);
mpGridMap = mp_grid_create(0, 0, map_w, map_h, TILE_W, TILE_H);
pSeeing = array_create(2, false);