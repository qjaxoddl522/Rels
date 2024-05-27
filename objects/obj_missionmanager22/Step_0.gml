/// @description 적 소환, 종료 조건
if global.missionState == ms.playing{
	if !obj_player1.visible or !obj_player2.visible{
		alarm[1] = 2*game_get_speed(gamespeed_fps);
		global.missionState = ms.fail; //실패
	}
	if condition == 3 and !instance_exists(obj_dialogBox){
		global.availableStage = array_equals(global.availableStage, [2, 2]) ? [3, 1] : global.availableStage;
		alarm[1] = 2*game_get_speed(gamespeed_fps);
		global.missionState = ms.clear; //클리어
	}
	//조건 다루기
	switch(condition){
		case 0:{
			scr_dialogEnqueue("카엘", [
			"전엔 정말 잘했어! 덕분에 너희는 지금 Rels의 메모리가 있는 중심부로 향하고 있어.",
			"이 안을 그냥 대놓고 돌아다니기에는 아까 봤다시피 뜨거운 관심이 너무 많이 쏠려서, 파이프라인실을 통해 돌아서 갈거야.",
			"문제는 여기도 안전하지는 않다는거지. 적들도 이 길을 모를리가 없으니까...",
			"많은 병력이 있지만, 길이 좁은 덕분에 각개격파 하기 쉬워. 길 사이사이에 있는 엄폐물을 잘 이용하면 체력 손실이 크지 않을걸?",
			"저기 파이프라인실 출구까지 가면 돼. 나는 뒤에서 응원할게.."
			], "tl_action22_1");
			++condition;
		break;}
		case 1:{
			if instance_exists(obj_position){
				if (abs(players[0].x-aimPositionX[0])+abs(players[0].y-aimPositionY[0])) < 2
				and (abs(players[1].x-aimPositionX[1])+abs(players[1].y-aimPositionY[1])) < 2{
					instance_destroy(obj_position);
					++condition;
				}
			}
		break;}
		case 2:{
			scr_dialogEnqueue("카엘", [
			"우와, 이번거 정말 성과가 엄청난걸?",
			"이쪽이야! 얼른 가자고."
			]);
			++condition;
		break;}
	}
}