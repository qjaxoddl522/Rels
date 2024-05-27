/// @description 변수 선언
p1x = 8+sprite_get_width(spr_missionPanel)/2; 
p2x = VIEW_W+sprite_get_width(spr_missionPanel)/2+32;
p2Aimx = 248+sprite_get_width(spr_missionPanel)/2;
p3x = p2x;

p1y = 8+(sprite_get_height(spr_missionPanel)/2); p2y = 8+(sprite_get_height(spr_missionPanelHalf)/2);
p3y = 16+p2y+sprite_get_height(spr_missionPanelHalf);

pState[1] = 0; //0은 무기, 1은 보조무기
pState[0] = 0;
appear = true;
picked = false;
disap = false;

scx[1] = -(16+string_width(scrap[1]));
scx[0] = -(16+string_width(scrap[0]));
scAimx[1] = scx[1];
scAimx[0] = scx[0];

scrapColor[1] = 0;
scrapColor[0] = 0;
purchaseWait[1] = 0;
purchaseWait[0] = 0;