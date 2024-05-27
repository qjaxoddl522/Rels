/// @description 공격 시 행동
behavior = state.attack;

var aim = players[aimPlayer];
if ammo==0{
	scr_enemyDelay(delay.ammo);
	isReady = false;
	isReloading = true;
}else if atNum>0{
	var bul = instance_create_depth(x, y, -1, obj_enemy2_bullet);
	bul.damage = damage;
	bul.aimX = aim.x div TILE_W*TILE_W+TILE_W/2;
	bul.aimY = aim.y div TILE_H*TILE_H+TILE_H/2;
	
	scr_enemyDelay(atDelay);
	isReady = false;
	--atNum;
	--ammo;
}else{
	event_user(12); //자리잡기 좌표 지정
	atNum = atNumMax;
}