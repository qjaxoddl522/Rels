/// @description 정의
depth = -100;

global.missionState = ms.start;
obj_player1.visible = false;
obj_player2.visible = false;

stAlpha = 1;
tx = -VIEW_W/2;
ty = (VIEW_H/5+VIEW_H/2)/2;
aim_tx = VIEW_W/2+2;

rh1 = VIEW_H/5;
rh2 = VIEW_H/2;
rec_disap = 0;

alarm[0] = 3*game_get_speed(gamespeed_fps);

condition = 0;

//현재 스테이지와 관련된 변수들
cursorMove[1] = false; //커서 이동 테스트
shoot[1] = false; //공격 확인

globalvar aimPositionX, aimPositionY;
aimPositionX[1] = -4; //목표 위치
aimPositionY[1] = -4; //목표 위치