/// @description 플레이어 소환, 대화 시작
var ef;
ef = instance_create_depth(obj_player1.x, obj_player1.y, -99, obj_shotEffect);
ef.sprite_index = spr_summon;
ef = instance_create_depth(obj_player2.x, obj_player2.y, -99, obj_shotEffect);
ef.sprite_index = spr_summon;
obj_player1.visible = true;
obj_player2.visible = true;
global.missionState = ms.playing;