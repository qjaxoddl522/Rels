/// @description 적 소환, 종료 조건
if global.missionState == ms.playing{
	if !obj_player1.visible or !obj_player2.visible{
		alarm[1] = 2*game_get_speed(gamespeed_fps);
		global.missionState = ms.fail; //실패
	}
	if condition == 7 and !instance_exists(obj_dialogBox){
		global.availableStage = array_equals(global.availableStage, [1, 3]) ? [2, 1] : global.availableStage;
		alarm[1] = 2*game_get_speed(gamespeed_fps);
		global.missionState = ms.clear; //클리어
	}
	//조건 다루기
	switch(condition){
		case 0:{
			scr_dialogEnqueue("카엘", [
			"안녕! 드디어 시작하네.",
			"첫 임무는 어렵지 않아. 다른 동료들이 점령한 곳이긴 하지만, 급하게 지나가서 그런지 아직 적의 잔당들이 남아 있어.",
			"복도를 지나다니면서 방을 샅샅이 뒤져야 적을 다 잡을 수 있을거야.",
			"너희들의 체력바 사이에 있는 남은 적의 수를 0으로 만들면 끝!",
			"어려운 일은 아니니까, 둘이서 합을 맞춰보는 시간을 가졌으면 좋겠어.",
			"그럼 파이팅!"
			]);
			++condition;
		break;}
		case 1:{
			if instance_number(objPa_enemy)<=9{
				++condition;
			}
		break;}
		case 2:{
			if instance_number(objPa_enemy)<=7{
				++condition;
			}
		break;}
		case 3:{
			if instance_number(objPa_enemy)<=4{
				++condition;
			}
		break;}
		case 4:{
			if instance_number(objPa_enemy)==0{
				alarm[2] = game_get_speed(gamespeed_fps);
				++condition;
			}
		break;}
		case 6:{
			scr_dialogEnqueue("카엘", [
			"...",
			"이건 버리지 않아도 되겠는걸?",
			"...",
			"앗, 끝났구나!",
			"생각보다 빨리 정리해서 끝난 줄도 몰랐네.",
			"좋아, 수고했어. 첫 임무인데도 잘 해줬어.",
			"이제 얻은 스크랩으로 하고싶은 것 좀 하고, 다음 장소로 가자!"
			]);
			++condition;
		break;}
	}
}