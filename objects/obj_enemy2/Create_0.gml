/// @description 능력치 및 초기설정
event_inherited();
//능력치
hp = 60;
moveDis = 4;
moveSpd = 1;
sightRange = 8;
damage = 2;
ammo = 2;
atRange = 10;
atDelay = 5;

//기타 개인적 설정
atNum = 3; //해당 변수만큼 발사하고 자리 변경
atNumMax = atNum;
ammoMax = ammo;

spr_idle = sprite_index;
spr_die = spr_enemy2Die;

myLoc = [x div TILE_W, y div TILE_H];

hitRate = noone;