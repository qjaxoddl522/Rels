/// @description 적 소환, 종료 조건
if global.missionState == ms.playing{
	if !obj_player1.visible or !obj_player2.visible{
		alarm[1] = 2*game_get_speed(gamespeed_fps);
		global.missionState = ms.fail; //실패
	}
	if condition == 12 and !instance_exists(obj_dialogBox){
		global.availableStage[1] += array_equals(global.availableStage, [1, 1]) ? 1 : 0;
		alarm[1] = 2*game_get_speed(gamespeed_fps);
		global.missionState = ms.clear; //클리어
	}
	//조건 다루기
	switch(condition){
		case 0:{
			scr_dialogEnqueue("??", [
			"안녕!",
			]);
			scr_dialogEnqueue("카엘", [
			"앗, 나는 너희들의 보좌관을 맡은 카엘이야.",
			"간단하게 현재 우리 상황을 말하자면, 매우 안좋다고 할 수 있어.",
			"지금 기계들 대부분이 Rels에게 조종당하고 있고, 우리도 물론 비상용 인프라를 이용해 분전하고 있지만 시간이 그리 많지 않아.",
			"그래서 너희는 내가 알려주는 약간의 정보를 가지고 바로 임무들을 수행하게 될거야.",
			"너무 걱정하지마. 내가 실전에서도 기계들을 상대할 수 있도록 도와줄게.",
			"먼저 기본적인 것부터 해보자.",
			"각자 자신의 캐릭터에 있는 네모난 게 있지? 한 번 움직어 볼래?"
			]);
			++condition;
		break;}
		case 1:{
			if ((players[0].x != players[0].cursor.x) or (players[0].y != players[0].cursor.y)) and !cursorMove[0]
				cursorMove[0] = true;
			if ((players[1].x != players[1].cursor.x) or (players[1].y != players[1].cursor.y)) and !cursorMove[1]
				cursorMove[1] = true;
			if cursorMove[0] and cursorMove[1]{
				alarm[2] = game_get_speed(gamespeed_fps);
				++condition;
			}
		break;}
		case 3:{
			scr_dialogEnqueue("카엘", [
			"좋아! 잘 하는걸. 그 네모난 게 각자의 커서고, 위치나 대상을 결정할 때마다 커서를 사용하게 될 거야. 또 시선도 커서 쪽으로 쏠리니까 안보이는 곳에서 맞지 않게 조심해.",
			"이제 각자 "+scr_keyboardToString(pButton1[0])+"키와 "+scr_keyboardToString(pButton1[1])+"키를 이용해 캐릭터를 저 위치로 움직여봐. 커서를 원하는 위치에 옮기고, 내가 말한 키를 누르면 캐릭터가 그쪽으로 이동할거야.",
			],"tl_action11_1");
			++condition;
		break;}
		case 4:{
			if instance_exists(obj_position){
				if (abs(players[0].x-aimPositionX[0])+abs(players[0].y-aimPositionY[0])) < 2
				and (abs(players[1].x-aimPositionX[1])+abs(players[1].y-aimPositionY[1])) < 2{
					instance_destroy(obj_position);
					++condition;
				}
			}
		break;}
		case 5:{
			scr_dialogEnqueue("카엘", [
			"잘했어! 다시 한 번 이동해서 문 밖으로 나와봐."
			], "tl_action11_2");
			++condition;
		break;}
		case 6:{
			if instance_exists(obj_position){
				if (abs(players[0].x-aimPositionX[0])+abs(players[0].y-aimPositionY[0])) < 2
				and (abs(players[1].x-aimPositionX[1])+abs(players[1].y-aimPositionY[1])) < 2{
					instance_destroy(obj_position);
					++condition;
				}
			}
		break;}
		case 7:{
			scr_dialogEnqueue("카엘", [
			"이동하는 동안 왼쪽 밑을 봤는지 모르겠지만 어떤 행동을 하면 그에 따른 딜레이가 행동 후에 생기고, 그 딜레이만큼 기다려야 다른 행동을 할 수 있어.",
			"딜레이의 길이는 어떤 행동을 하느냐에 달라지고, 공격할 때는 무기에 따라 달라져.",
			"시야도 매우 중요해. 시야가 없으면 적을 볼 수 없어서 조심해야 해. 특히 지금처럼 벽을 끼고 있다면, 바로 앞에 있어도 적이 있는지 알 수 없는 경우가 많아.",
			"설명은 이쯤하고, 한 번 더미에게 공격해보자.",
			"커서를 적에게 가져다 대면 이동을 하는 대신 조준을 할 수 있어. 너희 사이에 있는 더미에게 조준해보자."
			], "tl_action11_3");
			++condition;
		break;}
		case 8:{
			if instance_exists(obj_position){
				if (abs(players[0].cursor.x-aimPositionX[0])+abs(players[0].cursor.y-aimPositionY[0])) < 2
				and (abs(players[1].cursor.x-aimPositionX[1])+abs(players[1].cursor.y-aimPositionY[1])) < 2{//조준
					instance_destroy(obj_position);
					++condition;
				}
			}
		break;}
		case 9:{
			scr_dialogEnqueue("카엘", [
			"조준하면 백분율이 적의 머리 위에 뜨는게 보이지?",
			"그게 바로 그 적에 대한 명중률이야. 적을 맞출 확률.",
			"명중률이 나타나기 전에도 공격할 수 있고, 나타나기 전에 공격한다고 해서 명중률이 달라지지 않아.",
			"그러니까 명중률이 대충 예상이 된다면, 명중률이 나타나기 전에 공격해서 공격 딜레이를 조금 줄일 수 있어.",
			"당연하게도 거의 모든 상황에서 명중률이 100%가 아니니까 공격을 항상 맞출 수는 없어. 명중률은 거리가 멀어질수록 떨어지기 때문이야.",
			"무기를 고를 때 사거리가 있던 것 봤지? 사실 사거리에 밖에 있어도 공격할 수 있어.",
			"다만 무기의 사거리 밖에서 조준하면 알 수 있을거야. 사거리 밖에서 조준하면 명중률이 엄청나게 떨어져.",
			"그래서 웬만하면 사거리 안에서 조준하는 것을 추천해.",
			"아, 그리고 적을 향한 경로가 벽에 막히면 명중률이 0%가 되고 공격할 수 없어. 총알을 벽에다 낭비할 순 없잖아?",
			"이제 조준에 대한 설명은 끝이야! 각자 더미에게 공격!!"
			]);
			++condition;
		break;}
		case 10:{
			if (shoot[0] and shoot[1]){//공격
				++condition;
			}
		break;}
		case 11:{
			scr_dialogEnqueue("카엘", [
			"이거 내가 보좌관이 아니라 지휘관 같은걸... 흠흠!",
			"...",
			"미안.",
			"아무튼 타격할 때 데미지는 약간의 오차범위를 가지고 있고, 적의 hp가 0이 되면 더이상 싸우지 못하는 상태가 돼. 사람이라 치면 죽는거지.",
			"자, 이걸로 기본적인 설명은 끝이야.",
			"임무가 성공하든 실패하든 끝나면 스크랩을 얻을 수 있는데, 그걸로 새로운 무기나 파츠를 얻을 수 있어. 튜토리얼을 제외한 스테이지에서 대미지와 킬 수에 따라 받을 수 있으니 잘해봐!",
			"또 대미지 강화까지 할 수 있으니까 만약 임무가 힘들면 한 번 해보도록 해!",//삭제될 것인가
			"기초는 여기까지! 다음에는 좀 더 심도있는 부분을 알려줄게."
			]);
			++condition;
		break;}
	}
}