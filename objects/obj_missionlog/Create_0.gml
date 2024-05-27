/// @description 버튼 생성
p1x = -(8+sprite_get_width(spr_missionPanel)/2);
p1Aimx = 8+sprite_get_width(spr_missionPanel)/2;

p2x = VIEW_W+sprite_get_width(spr_missionPanel)/2;
p2Aimx = 248+sprite_get_width(spr_missionPanel)/2;

py = 8+(sprite_get_height(spr_missionPanel)/2);

stageSep = 48;

maxStage = global.availableStage[0]>global.chooseStage[0] ? array_length(global.levelName[global.chooseStage[0]]) : global.availableStage[1];
stageFirstY = py-(stageSep*(maxStage-1)/2); //스테이지 텍스트 첫 부분 y좌표

ch[0] = instance_create_depth(p1x, 88, -1, obj_missionCh1Button);
ch[1] = instance_create_depth(p1x, 88+48, -1, obj_missionCh2Button);
ch[2] = instance_create_depth(p1x, 88+48+48, -1, obj_missionCh3Button);