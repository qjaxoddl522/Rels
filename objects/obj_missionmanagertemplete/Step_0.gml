/// @description 적 소환, 종료 조건
if global.missionState == ms.playing{
	if !obj_player1.visible or !obj_player2.visible{
		alarm[1] = 2*game_get_speed(gamespeed_fps);
		global.missionState = ms.fail; //실패
	}
	/*if condition == 12 and !instance_exists(obj_dialogBox){
		global.availableStage[1] += array_equals(global.availableStage, [1, 1]) ? 1 : 0;
		alarm[1] = 2*game_get_speed(gamespeed_fps);
		global.missionState = ms.clear; //클리어
	}*/
	//조건 다루기
	switch(condition){
		case 0:{
			scr_dialogEnqueue("??", [
			"안녕!",
			]);
			scr_dialogEnqueue("카엘", [
			"아차, 나는 너희들을 보조해줄 보좌관 카엘이야.",
			"너희가 실전에서 기계들을 상대할 수 있도록 도와줄게.",
			"먼저 움직이는 것부터 해볼까?",
			"각자 자신의 캐릭터 위에 있는 네모난 게 있지? 한 번 움직어 볼래?"
			], "tl_action11_1");
			scr_dialogEnqueue("카엘", [
			"이걸 해봐. 쉽지?",
			]);
			++condition;
		break;}
		case 1:{
			
		break;}
	}
}