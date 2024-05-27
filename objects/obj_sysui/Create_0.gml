/// @description UI 관련 변수
depth = -5;

alpha = 1;
endalpha = 0;

//체력 관련
hp_mark[0] = pHealth[0];
hp_mark[1] = pHealth[1];
hpRec_mark[0] = pHealth[0];
hpRec_mark[1] = pHealth[1];

//일시정지 관련
gamePause = false;
pauseSurf = -1;
pauseSurfBuffer = -1;
remainEnemy = instance_number(objPa_enemy);

px = VIEW_W/2;
py = VIEW_H*3/2;
aimPy = py;