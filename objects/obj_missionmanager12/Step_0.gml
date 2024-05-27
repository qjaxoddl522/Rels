/// @description 적 소환, 종료 조건
if global.missionState == ms.playing{
	if !obj_player1.visible or !obj_player2.visible{
		alarm[1] = 2*game_get_speed(gamespeed_fps);
		global.missionState = ms.fail; //실패
	}
	if condition == 14 and !instance_exists(obj_dialogBox){
		global.availableStage[1] += array_equals(global.availableStage, [1, 2]) ? 1 : 0;
		alarm[1] = 2*game_get_speed(gamespeed_fps);
		global.missionState = ms.clear; //클리어
	}
	//조건 다루기
	switch(condition){
		case 0:{
			scr_dialogEnqueue("카엘", [
			"이번에는 적에 대해서 알아볼게.",
			"일단 적들은 전체적인 특징들이 있는데, 그 중 하나는 시야 거리야.",
			"대부분의 적들은 우리와 시야 거리가 같아. 물론 아닌 적들도 있지.",
			"하지만 시야 거리가 우리보다 짧을지언정 더 길지는 않아.",
			"그러니까 적들이 우릴 못 본다면 우리가 어디에 있는지는 절대 알 수 없어.",
			"그래도 보이기만 한다면 적들이 득달같이 달려들테니 대책을 준비해 놓아야 해.",
			"다음은 저쪽에 가서 얘기할까?"
			], "tl_action12_1");
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
			scr_dialogEnqueue("카엘",[
			"이 파이프 보여? 이건 엄폐물이야. 지나갈 수는 없지만, 벽처럼 공격 경로를 방해하진 않아.",
			"잠깐 몸풀기 겸 저쪽 더미에게 한 번 공격해보자.",
			], "tl_action12_2");
			++condition;
		break;}
		case 3:{
			if (shoot[0] and shoot[1]){//공격
				++condition;
			}
		break;}
		case 4:{
			scr_dialogEnqueue("카엘",[
			"처음엔 말하지 않았는데, 오른쪽 아래에 총알이 하나 사라졌지?",
			"당연하게도 총알이 모두 사라지면 재장전을 해야해.",
			"공격 키를 떼지 않고 꾹 누르고 있으면 수동으로 재장전을 할 수 있어.",
			"둘 다 한 번씩 수동으로 재장전 실시!"
			]);
			++condition;
		break;}
		case 5:{
			if reload[0] and reload[1] and once{
				once = false;
				alarm[2] = delay.ammo*game_get_speed(gamespeed_fps);
			}
		break;}
		case 6:{
			scr_dialogEnqueue("카엘",[
			"둘 다 잘했어! 총알이 없는데 공격하려고 하면 자동으로 재장전을 하니까, 꽤나 긴 재장전 시간에 발이 묶이지 않도록 조심해.",
			"이런 상황을 방지하기 위해서, 안전할 때 미리 수동으로 재장전 해놓는 것이 좋아.",
			"다음으로 이동!"
			],"tl_action12_3");
			++condition;
		break;}
		case 7:{
			if instance_exists(obj_position){
				if (abs(players[0].x-aimPositionX[0])+abs(players[0].y-aimPositionY[0])) < 2
				and (abs(players[1].x-aimPositionX[1])+abs(players[1].y-aimPositionY[1])) < 2{
					instance_destroy(obj_position);
					++condition;
				}
			}
		break;}
		case 8:{
			scr_dialogEnqueue("카엘",[
			"저 아래에 있는 적들에게 조준 한 번 해볼까?",
			], "tl_action12_4");
			++condition;
		break;}
		case 10:{
			if instance_exists(obj_position){
				if (abs(players[0].cursor.x-aimPositionX[0])+abs(players[0].cursor.y-aimPositionY[0])) < 2
				and (abs(players[1].cursor.x-aimPositionX[1])+abs(players[1].cursor.y-aimPositionY[1])) < 2{//조준
					instance_destroy(obj_position);
					++condition;
				}
			}
		break;}
		case 11:{
			scr_dialogEnqueue("카엘",[
			"명중률이 많이 떨어졌지?",
			"그게 바로 엄폐물의 진짜 기능이야.",
			"엄폐물이 자신 주위에 있으면, 엄폐물이 있는 방향에서 오는 총알은 명중률이 크게 떨어져.",
			"그러니까 엄폐물이 있어야 적들과의 교전에서 우위를 가져갈 수 있다는 뜻이야.",
			"마지막으로 정말 중요한 걸 알려줄게. 아파도 참아."
			], "tl_action12_5");
			++condition;
		break;}
		case 12:{
			if pHealth[0] > pLowestHealth[0]+3{
				++condition;
			}
		break;}
		case 13:{
			scr_dialogEnqueue("카엘",[
			"체력이 회복되고 있는거 보여?",
			"이게 바로 적들로부터 명중률을 낮추고 서로를 지키며 정비 시간을 가져야 하는 가장 큰 이유야.",
			"하지만 일정 이상의 피해를 입으면 완전히 회복할 수 없어.",
			"그래도 인간만의 장점이 있다는게 좋은거 아니겠어?",
			"적에게 피격당하면, 일정 시간이 지나고 초록색 체력까지 천천히 회복해.",
			"다른 행동을 한다고 해서 체력 회복이 멈추진 않으니 적에게 시선이 쏠리지 않았다면 팀원을 도와주는 것이 좋아.",
			"체력은 무슨 일이 있어도 초록색 체력을 넘어서 회복되지 않으니까 쓸데없는 짓은 하지마!",
			"자, 내가 알려줄 수 있는건 모두 알려준 것 같네. 내가 말하지 않은 것도 있겠지만, 그런건 직접 싸우면서 알아가야해. 다음이 첫 임무니까 준비되면 시작하자!"
			]);
			++condition;
		break;}
	}
}