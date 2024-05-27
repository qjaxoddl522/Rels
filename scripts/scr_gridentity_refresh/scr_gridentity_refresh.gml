function scr_gridEntity_refresh(_x, _y, aimX, aimY, number){
	gridEntity[# _x div TILE_W, _y div TILE_H] = -1;
	gridEntity[# aimX div TILE_W, aimY div TILE_H] = number;
}