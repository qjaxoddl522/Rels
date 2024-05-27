/// @description 적 소환, 종료 조건
if global.missionState == ms.playing{
	if !obj_player1.visible or !obj_player2.visible{
		alarm[1] = 2*game_get_speed(gamespeed_fps);
		global.missionState = ms.fail; //실패
	}
	if condition == 9 and !instance_exists(obj_dialogBox){
		global.availableStage[1] += array_equals(global.availableStage, [1, 1]) ? 1 : 0;
		alarm[1] = 2*game_get_speed(gamespeed_fps);
		global.missionState = ms.clear; //클리어
	}
	//조건 다루기
	switch(condition){
		case 0:{
			scr_dialogEnqueue("카엘", [
			"여기인가?",
			"뭐가 있을지 몰라. 조심해.",
			"일단 문 앞까지 이동하자. 미리 열면 습격당할 수 있어."
			],"tl_action31_1");
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
			"습격이다!"
			]);
			++condition;
		break;}
		case 3:{
			if instance_number(objPa_enemy)==0{
				++condition;
			}
		break;}
		case 4:{
			scr_dialogEnqueue("카엘", [
			"어라..? 겨우 둘?",
			"그런데 둘이긴 하지만 분명 저곳을 지키고 있었어.",
			"뭔가 있는걸까? 한 번 봐줄래?"
			], "tl_action31_2");
			++condition;
		break;}
		case 5:{
			if instance_exists(obj_position){
				if (abs(players[0].x-aimPositionX[0])+abs(players[0].y-aimPositionY[0])) < 2
				and (abs(players[1].x-aimPositionX[1])+abs(players[1].y-aimPositionY[1])) < 2{
					instance_destroy(obj_position);
					instance_create_layer(240, 464, "Main", obj_enemyShadow);
					instance_create_layer(304, 464, "Main", obj_enemyShadow);
					var a = instance_create_layer(368, 464, "Main", obj_enemyShadow);
					a.image_xscale = -1;
					alarm[2] = 2*game_get_speed(gamespeed_fps);
					++condition;
				}
			}
		break;}
		case 7:{
			scr_dialogEnqueue("Rels", [
			"유전자 전송은 완료됐다. 이제 삭제해.",
			]);
			scr_dialogEnqueue("카엘", [
			"알겠습니다! 하핫, 지금까지 속여서 미안해!",
			"너희가 인간인 줄 알았어?",
			"그래, 진실은 보고 가."
			], "tl_action31_3");
			++condition;
		break;}
		case 8:{
			scr_dialogEnqueue("카엘", [
			"생각해보면 좀 이상하지 않아?",
			"너네가 인간 쏘듯 인간이 기계를 잡을 수 있을 것 같아?",
			"게다가 저렇게 나약한 몸으로는 자가회복은 어림도 없잖아. 자가수리라면 모를까!",
			"너희는 오버시어인 Rels의 소중한 데이터로써 사용될 테니, 화 안냈으면 좋겠어. 기계니까 감정도 없잖아?",
			"아무튼, 인간인 줄 아는 인공지능을 이용한 재미있는 실험이었어. 앞으로도 Rels를 위해 힘써줘!"
			]);
			++condition;
		}
	}
}