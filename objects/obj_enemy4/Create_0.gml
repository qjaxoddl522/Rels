/// @description 능력치 및 초기설정
event_inherited();
//능력치
hp = 100;
moveDis = 3;
moveSpd = 2;
sightRange = 8;
damage = 5;
ammo = 3;
atRange = 5;
atDelay = 2;

//기타 개인적 설정
atNum = 3; //해당 변수만큼 발사하고 자리 변경
atNumMax = atNum;
ammoMax = ammo;

spr_idle = sprite_index;
spr_gun = spr_enemy4Gun;
spr_die = spr_enemy4Die;

myLoc = [x div TILE_W, y div TILE_H];

weaponX = x;
weaponY = y;

hitRate = noone;