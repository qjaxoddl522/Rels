/// @description 무기 변경, 구매
if !appear and !(disap or alarm[0] != -1){
	if !picked{
		for(var i=0; i<2; ++i;){
			if pState[i] < 2{
				if keyboard_check_pressed(pRight[i]){
					pWeapon[i][pState[i]] += pWeapon[i][pState[i]]<array_length(weaponDesc[pState[i]])-1 ? +1 : 0;
				}
				if keyboard_check_pressed(pLeft[i]){
					pWeapon[i][pState[i]] += pWeapon[i][pState[i]]>0 ? -1 : 0;
				}
				if keyboard_check_pressed(pButton1[i]){
					if weaponPrice[i][pState[i]][pWeapon[i][pState[i]]] == 0 and pWeapon[i][0] != 0{//무기를 고르겠다는 뜻
						pState[i] += pState[i]<2 ? 1 : 0;
					}else{ //뭔가 사겠다는 뜻
						if pState[i] == 0 and pWeapon[i][0] == 0{//업그레이드?
							if scrap[i] >= weaponPrice[i][0][0]{
								weaponUpg[i] += 1;
								scrap[i] -= weaponPrice[i][0][0];
								weaponPrice[i][0][0] += 100;
								purchaseWait[i] = game_get_speed(gamespeed_fps);
								scrapColor[i] = 1;
							}else{//돈 없으면 빨간 표시
								scrapColor[i] = 5;
							}
							alarm[i+1] = 0.1*game_get_speed(gamespeed_fps);
						}else{//새로운 무기나 파츠?
							if scrap[i] >= weaponPrice[i][pState[i]][pWeapon[i][pState[i]]]{
								scrap[i] -= weaponPrice[i][pState[i]][pWeapon[i][pState[i]]];
								weaponPrice[i][pState[i]][pWeapon[i][pState[i]]] = 0;
								purchaseWait[i] = game_get_speed(gamespeed_fps);
								scrapColor[i] = 1;
							}else{//돈 없으면 빨간 표시
								scrapColor[i] = 5;
							}
							alarm[i+1] = 0.1*game_get_speed(gamespeed_fps);
						}
					}
				}
			}
			if keyboard_check_pressed(pButton2[i]){//취소
				pState[i] += pState[i]>0 ? -1 : 0;
			}
			purchaseWait[i] = max(0, purchaseWait[i]-1);
		}
		
		//선택 완료
		if pState[0]==2 and pState[1]==2{
			alarm[0] = game_get_speed(gamespeed_fps);
			picked = true;
		}
	}
}

if appear{
	p2x += (p2Aimx-p2x)/15;
	p3x = p2x;
	if abs(p2Aimx-p2x)<1{
		p2x = p2Aimx;
		appear = false;
	}
}

if disap{
	var _aim1 = (-sprite_get_width(spr_missionPanel)/2-8);
	var _aim2 = room_width+(sprite_get_width(spr_missionPanel)/2+8);
	var _aim3 = room_width+(sprite_get_width(spr_missionPanel)/2+8);
	p1x += (_aim1-p1x)/15;
	p2x += (_aim2-p2x)/15;
	p3x += (_aim3-p3x)/15;
	if abs(_aim1-p1x)<1{
		room_goto(asset_get_index("room_"+string(global.chooseStage[0])+string(global.chooseStage[1])));
	}
}