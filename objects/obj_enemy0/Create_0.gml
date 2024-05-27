/// @description 능력치 및 초기설정
event_inherited();
//능력치
hp = 999;
moveDis = 0;
moveSpd = 2;
sightRange = 8;
damage = 5;
ammo = 3;
atRange = 5;
atDelay = 2;

//기타 개인적 설정
ammoMax = ammo;

spr_idle = sprite_index;
spr_die = sprite_index;

myLoc = [x div TILE_W, y div TILE_H];

weaponX = x;
weaponY = y;

hitRate = noone;

//풀피 만들기
full = true;