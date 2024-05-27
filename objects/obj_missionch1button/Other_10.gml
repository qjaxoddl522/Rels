/// @description 챕터 변경
if instance_exists(obj_missionLog){
	if obj_missionLog.p1x == obj_missionLog.p1Aimx and obj_missionLog.p2x == obj_missionLog.p2Aimx{
		global.chooseStage[0] = 1;
	}
}