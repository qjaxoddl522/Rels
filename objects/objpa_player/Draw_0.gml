/// @description 여러가지 드로우
cursorOnEntity = gridEntity[# cursor.x div TILE_W, cursor.y div TILE_H] != -1;
//path 드로우
if path_exists(path) and (isReady or isMoving) and (!cursorOnEntity or isMoving or gridSight[# cursor.x div TILE_W, cursor.y div TILE_H] == 0){
	var ocha = 10; //오차범위
	var path_length = isMoving ? path_get_number(path_real)-1 : path_get_number(path)-1;
	for(var i=drawing; i<path_length; ++i) {
		var corner = 0, ysc = 1;
		
		//방향관련
		var dir1 = point_direction(
	        path_get_point_x(path, i-1), path_get_point_y(path, i-1),
	        path_get_point_x(path, i+1), path_get_point_y(path, i+1));
		if (((dir1+45)%90 < ocha/2) or ((dir1+45+ocha/2)%90 < ocha/2)){
			corner = 1;
			var dir1 = point_direction(
	        path_get_point_x(path, i-1), path_get_point_y(path, i-1),
	        path_get_point_x(path, i), path_get_point_y(path, i));
			
			var dir2 = point_direction(
	        path_get_point_x(path, i), path_get_point_y(path, i),
	        path_get_point_x(path, i+1), path_get_point_y(path, i+1));
			if abs((dir2+90)%360-dir1)>ocha{
				ysc = -1;
			}
		}
		
		//이동 거리 끝이면 인덱스 변경
		if i == pMoveDis[player]
			corner = 2;
		
		draw_sprite_ext(i<=pMoveDis[player] ? spr_pathLine : spr_pathLineLimit, corner, path_get_point_x(path, i), path_get_point_y(path, i), 1, ysc, dir1, c_white, 0.5);
	}
	draw_sprite_ext(path_length<=pMoveDis[player] ? spr_pathLine : spr_pathLineLimit, 2, path_get_point_x(path, path_length), path_get_point_y(path, path_length), 1, 1, 
	point_direction(
	path_get_point_x(path, path_length-1), path_get_point_y(path, path_length-1),
	path_get_point_x(path, path_length), path_get_point_y(path, path_length)),
	c_white, 0.5);
}
draw_self();

//재장전 드로우
if alarm[2] > 0{
	draw_sprite(spr_reloading, 0, x, y-TILE_H);
}

//무기 드로우
weaponX = x+6*image_xscale-lengthdir_x(shotX, dir);
weaponY = y-4-lengthdir_y(shotX, dir);
if !isAttacking
	weaponDir = dir;
draw_sprite_ext(weaponSprite[pWeapon[player][0]], min(1, weaponImg), weaponX, weaponY, 1, image_xscale, weaponDir+shotRot*image_xscale, c_white, 1);