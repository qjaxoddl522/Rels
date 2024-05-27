/// @description 공격
var cx = cursor.x div TILE_W, cy = cursor.y div TILE_H;
if aimId != noone and gridSight[# cx, cy] == 1 and hitRate != 0{
	behavior = 1;
	isReady = false;
	isAttacking = true;
	var spr = weaponSprite[pWeapon[player][0]];
	var bul = instance_create_layer(weaponX+lengthdir_x(sprite_get_width(spr)-sprite_get_xoffset(spr), weaponDir), weaponY+lengthdir_y(sprite_get_width(spr)-sprite_get_xoffset(spr), weaponDir), "Main",
	asset_get_index("obj_"+string_copy(sprite_get_name(spr), 5, string_length(sprite_get_name(spr))-4)+"_bullet"));
	bul.aimId = aimId;
	bul.orderPlayer = player;
	var aimSpr = aimId.sprite_index;
	if hitRate>=random(1){ //명중 여부
		bul.damage = weaponStat[pWeapon[player][0]][0]+weaponUpg[player]*weaponUpgAtt[pWeapon[player][0]];
		var randX = random_range(aimId.x-sprite_get_xoffset(aimSpr)+sprite_get_bbox_left(aimSpr), aimId.x-sprite_get_xoffset(aimSpr)+sprite_get_bbox_right(aimSpr));
		var randY = random_range(aimId.y-sprite_get_yoffset(aimSpr)+sprite_get_bbox_top(aimSpr), aimId.y-sprite_get_yoffset(aimSpr)+sprite_get_bbox_bottom(aimSpr));
		bul.aimX = randX;
		bul.aimY = randY;
	}else{
		bul.damage = 0;
		var randX = choose(random_range(aimId.x-sprite_get_xoffset(aimSpr), aimId.x-sprite_get_xoffset(aimSpr)+sprite_get_bbox_left(aimSpr)), random_range(aimId.x-sprite_get_xoffset(aimSpr)+sprite_get_bbox_right(aimSpr), aimId.x-sprite_get_xoffset(aimSpr)+sprite_get_width(aimSpr)));
		var randY = choose(random_range(aimId.y-sprite_get_yoffset(aimSpr), aimId.y-sprite_get_yoffset(aimSpr)+sprite_get_bbox_top(aimSpr)), random_range(aimId.y-sprite_get_yoffset(aimSpr)+sprite_get_bbox_bottom(aimSpr), aimId.y-sprite_get_yoffset(aimSpr)+sprite_get_height(aimSpr)));
		bul.aimX = randX;
		bul.aimY = randY;
	}
	weaponImg = bul.react;
	shotX = bul.react*1.5;
	shotRot = bul.react*3;
	--ammo;
	
	//튜토리얼 전용
	if (instance_exists(obj_missionManager11) and obj_missionManager11.condition == 10)
		obj_missionManager11.shoot[player] = true;
	if (instance_exists(obj_missionManager12) and obj_missionManager12.condition == 3)
		obj_missionManager12.shoot[player] = true;
}