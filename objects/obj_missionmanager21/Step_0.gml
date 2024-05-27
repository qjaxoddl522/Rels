/// @description 적 소환, 종료 조건
if global.missionState == ms.playing{
	var defense = true;
	with(objPa_enemy){
		if y >= 912{
			with(other)defense = false;
		}
	}
	if !defense{
		alarm[1] = 2*game_get_speed(gamespeed_fps);
		global.missionState = ms.fail; //실패
		scr_systemMessage(0, "입구를 지키지 못했습니다!");
		scr_systemMessage(1, "입구를 지키지 못했습니다!");
	}
	
	if !obj_player1.visible or !obj_player2.visible{
		alarm[1] = 2*game_get_speed(gamespeed_fps);
		global.missionState = ms.fail; //실패
	}
	if condition == 11 and !instance_exists(obj_dialogBox){
		global.availableStage[1] += array_equals(global.availableStage, [2, 1]) ? 1 : 0;
		alarm[1] = 2*game_get_speed(gamespeed_fps);
		global.missionState = ms.clear; //클리어
	}
	
	var z1x = 16, z1y = 432;
	var z2x = 400, z2y = 16;
	var z3x = 560, z3y = 16;
	var z4x = 944, z4y = 432;
	//조건 다루기
	switch(condition){
		case 0:{
			scr_dialogEnqueue("카엘", [
			"잠깐! 더 이상 들어가지 마.",
			"이 앞에서 다수의 적이 감지됐어. 아무래도 들킨 것 같아.",
			"여기까지 왔으면 충분해. 이곳에 병력을 요청할게.",
			"함선이 입구에 정박해야 하니까, 적들이 입구 밖으로 나가지 못하게 막아줘. 명심해, 안쪽으로 들어가지 말고 자리를 지켜!",
			"시간은 3분이면 돼. 쉽진 않겠지만, 안될 건 없을거야!"
			]);
			++condition;
		break;}
		case 1:{
			if !instance_exists(obj_dialogBox){
				instance_create_layer(z1x, z1y, "Main", obj_enemy1);
				instance_create_layer(z1x, z1y+TILE_H, "Main", obj_enemy1);
				instance_create_layer(z4x, z1y, "Main", obj_enemy1);
				instance_create_layer(z4x, z1y+TILE_H, "Main", obj_enemy1);
				alarm[2] = game_get_speed(gamespeed_fps);
				++condition;
			}
		break;}
		case 2:{
			if second<=150{
				instance_create_layer(z2x, z2y, "Main", obj_enemy1);
				instance_create_layer(z2x+TILE_W, z2y, "Main", obj_enemy1);
				instance_create_layer(z3x, z3y, "Main", obj_enemy1);
				instance_create_layer(z3x+TILE_W, z3y, "Main", obj_enemy1);
				alarm[2] = game_get_speed(gamespeed_fps);
				++condition;
			}
		break;}
		case 3:{
			if second<=120{
				scr_dialogEnqueue("카엘", [
				"새로운 적이 감지됐어!"
				],"tl_action21_1");
				++condition;
			}
		break;}
		case 4:{
			scr_dialogEnqueue("카엘", [
			"저 기계, 맹독탄을 발사하는데, 탄속이 느려서 피할 수 있는 대신 맹독 웅덩이를 남겨서 큰 피해를 주는 것 같아.",
			"조심해, 절대 웅덩이에 들어가지 마."
			]);
			instance_create_layer(z1x, z1y, "Main", obj_enemy1);
			instance_create_layer(z4x, z4y, "Main", obj_enemy1);
			instance_create_layer(z3x, z3y, "Main", obj_enemy2);
			++condition;
		break;}
		case 5:{
			if second<=119{instance_destroy(obj_clearSight);}
			if second<=90{
				instance_create_layer(z1x, z1y, "Main", obj_enemy1);
				instance_create_layer(z1x, z1y+TILE_H, "Main", obj_enemy1);
				instance_create_layer(z4x, z4y, "Main", obj_enemy1);
				instance_create_layer(z4x, z4y+TILE_H, "Main", obj_enemy1);
				instance_create_layer(z2x, z2y, "Main", obj_enemy2);
				instance_create_layer(z3x, z3y, "Main", obj_enemy2);
				++condition;
			}
		break;}
		case 6:{
			if second<=60{
				scr_dialogEnqueue("카엘", [
				"앗, 저길 봐!",
				], "tl_action21_2");
				instance_create_layer(z1x, z1y, "Main", obj_enemy1);
				instance_create_layer(z1x, z1y+TILE_H, "Main", obj_enemy2);
				instance_create_layer(z4x, z4y, "Main", obj_enemy1);
				instance_create_layer(z4x, z4y+TILE_H, "Main", obj_enemy2);
				instance_create_layer(z2x, z2y, "Main", obj_enemy1);
				instance_create_layer(z3x, z3y, "Main", obj_enemy1);
				++condition;
			}
		break;}
		case 7:{
			scr_dialogEnqueue("카엘", [
			"지름길 문이 열린걸 보니 더 많이 올 것 같은데...",
			"난 너흴 믿어!"
			]);
			++condition;
		break;}
		case 8:{
			if second<=30{
				instance_create_layer(z1x, z1y, "Main", obj_enemy2);
				instance_create_layer(z1x, z1y+TILE_H, "Main", obj_enemy2);
				instance_create_layer(z4x, z4y, "Main", obj_enemy2);
				instance_create_layer(z4x, z4y+TILE_H, "Main", obj_enemy2);
				instance_create_layer(z2x, z2y, "Main", obj_enemy1);
				instance_create_layer(z3x, z3y, "Main", obj_enemy1);
				++condition;
			}
		break;}
		case 9:{
			if second<=0{
				scr_dialogEnqueue("함대", [
				"도착했습니다!",
				]);
				scr_dialogEnqueue("카엘", [
				"좋아! 가볍게 입구 좀 치워볼까?",
				], "tl_action21_3");
				++condition;
			}
		break;}
		case 10:{
			scr_dialogEnqueue("카엘", [
			"우와! 역시 함선의 방.. 아니 전자포는 끝내준다니까!",
			"정말 수고했어! 이번 임무는 여기서 끝이야."
			]);
			++condition;
		break;}
	}
}