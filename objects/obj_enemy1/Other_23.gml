/// @description 공격 시 행동
behavior = state.attack;

var aim = players[aimPlayer];
if ammo==0{
	scr_enemyDelay(delay.ammo);
	isReady = false;
	isReloading = true;
}else if atNum>0{
	hitRate = scr_hitRate(atRange, aim);
	var bul = instance_create_depth(weaponX, weaponY, -1, obj_enemy4_bullet);
	var aimSpr = aim.sprite_index;
	bul.aimId = aim;
	if hitRate>=random(1){ //명중 여부
		bul.damage = damage;
		var randX = random_range(aim.x-sprite_get_xoffset(aimSpr)+sprite_get_bbox_left(aimSpr), aim.x-sprite_get_xoffset(aimSpr)+sprite_get_bbox_right(aimSpr));
		var randY = random_range(aim.y-sprite_get_yoffset(aimSpr)+sprite_get_bbox_top(aimSpr), aim.y-sprite_get_yoffset(aimSpr)+sprite_get_bbox_bottom(aimSpr));
		bul.aimX = randX;
		bul.aimY = randY;
	}else{
		var randX = choose(random_range(aim.x-sprite_get_xoffset(aimSpr), aim.x-sprite_get_xoffset(aimSpr)+sprite_get_bbox_left(aimSpr)), random_range(aim.x-sprite_get_xoffset(aimSpr)+sprite_get_bbox_right(aimSpr), aim.x-sprite_get_xoffset(aimSpr)+sprite_get_width(aimSpr)));
		var randY = choose(random_range(aim.y-sprite_get_yoffset(aimSpr), aim.y-sprite_get_yoffset(aimSpr)+sprite_get_bbox_top(aimSpr)), random_range(aim.y-sprite_get_yoffset(aimSpr)+sprite_get_bbox_bottom(aimSpr), aim.y-sprite_get_yoffset(aimSpr)+sprite_get_height(aimSpr)));
		bul.aimX = randX;
		bul.aimY = randY;
	}
	scr_enemyDelay(atDelay);
	isReady = false;
	--atNum;
	--ammo;
}else{
	event_user(12); //자리잡기 좌표 지정
	atNum = atNumMax;
}