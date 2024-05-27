/// @description 변수 정의
//능력치(각 오브젝트에서 변경)
hp = 50;
moveDis = 1;
moveSpd = 2;
sightRange = 8;
damage = 1;
ammo = 3;
atRange = 6;
atDelay = 2;

//기타 설정
depth = -1;
alarm[11] = 1;

spr_idle = undefined;
spr_gun = undefined;
spr_die = undefined;

firstX = x; //제자리 돌아갈 좌표
firstY = y;

lastDir = 0; //마지막으로 맞은 총알 방향
lastDam = 0; //마지막으로 맞은 총알 데미지
lastPlayer = 0; //마지막으로 타격한 플레이어
lastPx = x; //마지막으로 목격한 플레이어 좌표
lastPy = y;

hp_max = hp;
hp_mark = hp;
hp_alpha = 0;

moveX = x;
moveY = y;
behavior = state.stray;
inAction = false;
stop = false; //컷씬을 위한 정지 변수

recognizeTime = [0.5, 1];
function action(){
	inAction = true;
	alarm[1] = random_range(recognizeTime[0], recognizeTime[1])*game_get_speed(gamespeed_fps);
}

myRange = ds_grid_create(map_w, map_h);
myLoc = [x div TILE_W, y div TILE_H];

isReady = true;
isMoving = false;
isReloading = false;

//path 관련
path = path_add();
pathReady = false;

aimPlayer = noone;
aimDir = 0;