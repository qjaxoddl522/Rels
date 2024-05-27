/// @description 초기 설정
x = VIEW_W/2;
y = room_height+sprite_get_height(spr_missionResultPaenl)/2;
aimY = y;

text_alpha = 0;
text_draw = 0; //하나씩 그려짐

scrap_draw = false;
scrX = -40;
scrAimX = 40;
scrY = VIEW_H/2;

once = true;
snd = true;
alarm[0] = 3*game_get_speed(gamespeed_fps);