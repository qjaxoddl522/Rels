/// @description 능력치 및 초기설정
event_inherited();
//능력치
hp = 40;
moveDis = 2;
moveSpd = 3;
sightRange = 8;
damage = 3;
ammo = 3;
atRange = 4;
atDelay = 2;

//기타 개인적 설정
atNum = 3; //해당 변수만큼 발사하고 자리 변경
atNumMax = atNum;
ammoMax = ammo;

spr_idle = sprite_index;
spr_gun = spr_enemy1Gun;
spr_die = spr_enemy1Die;

myLoc = [x div TILE_W, y div TILE_H];

weaponX = x;
weaponY = y;

hitRate = noone;