/// @description 각종 UI드로우
draw_sprite(spr_missionPanel, 0, p1x, p1y);
draw_sprite(spr_missionPanelHalf, 0, p2x, p2y);
draw_sprite(spr_missionPanelHalf, 0, p2x, p3y);

draw_set_font(font_parts);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

var _weaponDisY = 96, _subweaponDisY = _weaponDisY/3;
var _iconDisY = -36, _descDisY = 16; //패널 중심에서부터 떨어진 거리

//1p 조작키
if pState[0]<2{
	draw_set_color(c_yellow);
	draw_set_font(font_keyDesc);
	draw_text(p1x-(pState[0]==0 ? 48 : 64), p1y-(pState[0]==0 ? _weaponDisY+44 : _subweaponDisY+4)+24, scr_keyboardToString(pLeft[0])); //키 설명
	draw_text(p1x+(pState[0]==0 ? 48 : 64), p1y-(pState[0]==0 ? _weaponDisY+44 : _subweaponDisY+4)+24, scr_keyboardToString(pRight[0]));
	draw_text(p1x, p1y-(pState[0]==0 ? _weaponDisY+44 : _subweaponDisY+4)+24, scr_keyboardToString(pButton1[0]));
	draw_set_color(c_white);
	draw_set_font(font_parts);
}

//1p 스크랩
scx[0] += (scAimx[0]-scx[0])/15;
if abs(scAimx[0]-scx[0])<1{
	scx[0] = scAimx[0];
}
var sty = p1y-_weaponDisY+44
draw_set_halign(fa_left);
if pState[0]<2{
	var stx = p1x-(sprite_get_width(spr_scrapIcon)/2+string_width(weaponPrice[0][pState[0]][pWeapon[0][pState[0]]]))/2;
	if (weaponPrice[0][pState[0]][pWeapon[0][pState[0]]] != 0){
		scAimx[0] = 10;
		draw_sprite_ext(spr_scrapIcon, 0, stx, sty, .5, .5, 0, c_white, 1);
		draw_text(stx+sprite_get_width(spr_scrapIcon)/2, sty, weaponPrice[0][pState[0]][pWeapon[0][pState[0]]]);
	}else if purchaseWait[0] == 0{scAimx[0] = -(16+string_width(scrap[0]));}
}else{scAimx[0] = -(16+string_width(scrap[0]));}
draw_sprite_ext(spr_scrapIcon, 0, scx[0], sty, .5, .5, 0, scrapColor[0]%2==0 ? c_white : c_red, 1);
draw_set_color(scrapColor[0]%2==0 ? c_white : c_red);
draw_text(scx[0]+10, sty, scrap[0]);
draw_set_halign(fa_center);
draw_set_color(c_white);

//1p 무기 선택
draw_sprite_ext(spr_missionWeaponSelectArrow, 0, p1x-48, p1y-_weaponDisY, -1, 1, 0, pState[0]==0 ? c_white : c_gray, 1);
draw_sprite_ext(weaponSprite[pWeapon[0][0]], 0, p1x, p1y-_weaponDisY, 1, 1, 0, weaponPrice[0][0][pWeapon[0][0]] == 0 or pWeapon[0][0] == 0 ? c_white : c_gray, 1);
draw_sprite_ext(spr_missionWeaponSelectArrow, 0, p1x+48, p1y-_weaponDisY, 1, 1, 0, pState[0]==0 ? c_white : c_gray, 1);
draw_set_color(pState[0]==0 ? c_white : c_gray);

draw_set_halign(fa_left);
draw_text(p1x-string_width(weaponList[pWeapon[0][0]]+(weaponUpg[0]>0 ? "+"+string(weaponUpg[0]) : ""))/2,
	p1y-_weaponDisY+24, weaponList[pWeapon[0][0]]);
draw_set_color(c_yellow);
if weaponUpg[0]>0{draw_text(p1x-string_width(weaponList[pWeapon[0][0]]+"+"+string(weaponUpg[0]))/2+string_width(weaponList[pWeapon[0][0]]),
	p1y-_weaponDisY+24, "+"+string(weaponUpg[0]));}
draw_set_halign(fa_center);
draw_set_color(c_white);

if pState[0]>0 {draw_sprite(spr_check, 0, p1x, p1y-_weaponDisY);}
if (weaponPrice[0][0][pWeapon[0][0]] != 0 and pWeapon[0][0] != 0){draw_sprite(spr_check, 1, p1x, p1y-_weaponDisY);}

//1p 보조무기 선택
draw_sprite_ext(spr_missionWeaponSelectArrow, 0, p1x-64, p1y-_subweaponDisY, -1, 1, 0, pState[0]==1 ? c_white : c_gray, 1);
draw_set_color((weaponPrice[0][1][pWeapon[0][1]] == 0) and (pState[0]==1) ? c_white : c_gray);
draw_text(p1x, p1y-_subweaponDisY, partsList[pWeapon[0][1]]);
draw_set_color(c_white);
draw_sprite_ext(spr_missionWeaponSelectArrow, 0, p1x+64, p1y-_subweaponDisY, 1, 1, 0, pState[0]==1 ? c_white : c_gray, 1);

if pState[0]>1 {draw_sprite(spr_check, 0, p1x, p1y-_subweaponDisY);}
if (weaponPrice[0][1][pWeapon[0][1]] != 0){draw_sprite(spr_check, 1, p1x, p1y-_subweaponDisY);}

var _totalLength = 138, _textDisY = 12;
//1p 무기 스탯, 설명
if pState[0] == 0{
	draw_set_halign(fa_left);
	draw_sprite(spr_weaponStatIcon, 0, p2x-(_totalLength/2)-sprite_get_width(spr_weaponStatIcon)+4, p2y+_iconDisY);
	draw_text(p2x-(_totalLength/2)+4, p2y+_iconDisY+2, weaponStat[pWeapon[0][0]][0]+weaponUpg[0]*weaponUpgAtt[pWeapon[0][0]]);
	draw_sprite(spr_weaponStatIcon, 1, p2x-(_totalLength/6)-sprite_get_width(spr_weaponStatIcon)+4, p2y+_iconDisY);
	draw_text(p2x-(_totalLength/6)+4, p2y+_iconDisY+2, weaponStat[pWeapon[0][0]][1]);
	draw_sprite(spr_weaponStatIcon, 2, p2x+(_totalLength/6)-sprite_get_width(spr_weaponStatIcon)+4, p2y+_iconDisY);
	draw_text(p2x+(_totalLength/6)+4, p2y+_iconDisY+2, weaponStat[pWeapon[0][0]][2]);
	draw_sprite(spr_weaponStatIcon, 3, p2x+(_totalLength/2)-sprite_get_width(spr_weaponStatIcon)+4, p2y+_iconDisY);
	draw_text(p2x+(_totalLength/2)+4, p2y+_iconDisY+2, weaponStat[pWeapon[0][0]][3]);
	draw_set_font(font_weaponDesc);
	draw_set_halign(fa_center);
	draw_text_ext(p2x, p2y+_textDisY, weaponDesc[0][pWeapon[0][0]], font_get_size(font_weaponDesc)+2, _totalLength+font_get_size(font_weaponDesc));
}else{
	draw_set_font(font_weaponDesc);
	draw_text_ext(p2x, p2y, weaponDesc[1][pWeapon[0][1]], font_get_size(font_weaponDesc)+2, _totalLength+font_get_size(font_weaponDesc));
}
draw_set_font(font_parts);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

//2p 조작키
if pState[1]<2{
	draw_set_color(c_yellow);
	draw_set_font(font_keyDesc);
	draw_text(p1x-(pState[1]==0 ? 48 : 64), p1y+(pState[1]==0 ? _subweaponDisY-44 : _weaponDisY-4)+24, scr_keyboardToString(pLeft[1])); //키 설명
	draw_text(p1x+(pState[1]==0 ? 48 : 64), p1y+(pState[1]==0 ? _subweaponDisY-44 : _weaponDisY-4)+24, scr_keyboardToString(pRight[1]));
	draw_text(p1x, p1y+(pState[1]==0 ? _subweaponDisY-44 : _weaponDisY-4)+24, scr_keyboardToString(pButton1[1]));
	draw_set_color(c_white);
	draw_set_font(font_parts);
}

//2p 스크랩
scx[1] += (scAimx[1]-scx[1])/15;
if abs(scAimx[1]-scx[1])<1{
	scx[1] = scAimx[1];
}
var sty = p1y+_subweaponDisY+44;
draw_set_halign(fa_left);
if pState[1]<2{
	var stx = p1x-(sprite_get_width(spr_scrapIcon)/2+string_width(weaponPrice[1][pState[1]][pWeapon[1][pState[1]]]))/2;
	if (weaponPrice[1][pState[1]][pWeapon[1][pState[1]]] != 0){
		scAimx[1] = 10;
		draw_sprite_ext(spr_scrapIcon, 0, stx, sty, .5, .5, 0, c_white, 1);
		draw_text(stx+sprite_get_width(spr_scrapIcon)/2, sty, weaponPrice[1][pState[1]][pWeapon[1][pState[1]]]);
	}else if purchaseWait[1] == 0{scAimx[1] = -(16+string_width(scrap[1]));}
}else{scAimx[1] = -(16+string_width(scrap[1]));}
draw_sprite_ext(spr_scrapIcon, 0, scx[1], sty, .5, .5, 0, scrapColor[1]%2==0 ? c_white : c_red, 1);
draw_set_color(scrapColor[1]%2==0 ? c_white : c_red);
draw_text(scx[1]+10, sty, scrap[1]);
draw_set_halign(fa_center);
draw_set_color(c_white);

//2p 무기 선택
draw_sprite_ext(spr_missionWeaponSelectArrow, 0, p1x-48, p1y+_subweaponDisY, -1, 1, 0, pState[1]==0 ? c_white : c_gray, 1);
draw_sprite_ext(weaponSprite[pWeapon[1][0]], 0, p1x, p1y+_subweaponDisY, 1, 1, 0, weaponPrice[1][0][pWeapon[1][0]] == 0 or pWeapon[1][0] == 0 ? c_white : c_gray, 1);
draw_sprite_ext(spr_missionWeaponSelectArrow, 0, p1x+48, p1y+_subweaponDisY, 1, 1, 0, pState[1]==0 ? c_white : c_gray, 1);
draw_set_color(pState[1]==0 ? c_white : c_gray);

draw_set_halign(fa_left);
draw_text(p1x-string_width(weaponList[pWeapon[1][0]]+(weaponUpg[1]>0 ? "+"+string(weaponUpg[0]) : ""))/2,
	p1y+_subweaponDisY+24, weaponList[pWeapon[1][0]]);
draw_set_color(c_yellow);
if weaponUpg[1]>0{draw_text(p1x-string_width(weaponList[pWeapon[1][0]]+"+"+string(weaponUpg[1]))/2+string_width(weaponList[pWeapon[1][0]]),
	p1y+_subweaponDisY+24, "+"+string(weaponUpg[1]));}
draw_set_halign(fa_center);
draw_set_color(c_white);

if pState[1]>0 {draw_sprite(spr_check, 0, p1x, p1y+_subweaponDisY);}
if (weaponPrice[1][0][pWeapon[1][0]] != 0 and pWeapon[1][0] != 0){draw_sprite(spr_check, 1 , p1x, p1y+_subweaponDisY);}

//2p 보조무기 선택
draw_sprite_ext(spr_missionWeaponSelectArrow, 0, p1x-64, p1y+_weaponDisY, -1, 1, 0, pState[1]==1 ? c_white : c_gray, 1);
draw_set_color((weaponPrice[1][1][pWeapon[1][1]] == 0) and (pState[1] == 1) ? c_white : c_gray);
draw_text(p1x, p1y+_weaponDisY, partsList[pWeapon[1][1]]);
draw_set_color(c_white);
draw_sprite_ext(spr_missionWeaponSelectArrow, 0, p1x+64, p1y+_weaponDisY, 1, 1, 0, pState[1]==1 ? c_white : c_gray, 1);

if pState[1]>1 {draw_sprite(spr_check, 0, p1x, p1y+_weaponDisY);}
if (weaponPrice[1][1][pWeapon[1][1]] != 0){draw_sprite(spr_check, 1, p1x, p1y+_weaponDisY);}

//2p 무기 스탯, 설명
if pState[1] == 0{
	draw_set_halign(fa_left);
	draw_sprite(spr_weaponStatIcon, 0, p2x-(_totalLength/2)-sprite_get_width(spr_weaponStatIcon)+4, p3y+_iconDisY);
	draw_text(p2x-(_totalLength/2)+4, p3y+_iconDisY+2, weaponStat[pWeapon[1][0]][0]+weaponUpg[1]*weaponUpgAtt[pWeapon[1][0]]);
	draw_sprite(spr_weaponStatIcon, 1, p2x-(_totalLength/6)-sprite_get_width(spr_weaponStatIcon)+4, p3y+_iconDisY);
	draw_text(p2x-(_totalLength/6)+4, p3y+_iconDisY+2, weaponStat[pWeapon[1][0]][1]);
	draw_sprite(spr_weaponStatIcon, 2, p2x+(_totalLength/6)-sprite_get_width(spr_weaponStatIcon)+4, p3y+_iconDisY);
	draw_text(p2x+(_totalLength/6)+4, p3y+_iconDisY+2, weaponStat[pWeapon[1][0]][2]);
	draw_sprite(spr_weaponStatIcon, 3, p2x+(_totalLength/2)-sprite_get_width(spr_weaponStatIcon)+4, p3y+_iconDisY);
	draw_text(p2x+(_totalLength/2)+4, p3y+_iconDisY+2, weaponStat[pWeapon[1][0]][3]);
	draw_set_font(font_weaponDesc);
	draw_set_halign(fa_center);
	draw_text_ext(p2x, p3y+_textDisY, weaponDesc[0][pWeapon[1][0]], font_get_size(font_weaponDesc)+2, _totalLength+font_get_size(font_weaponDesc));
}else{
	draw_set_font(font_weaponDesc);
	draw_text_ext(p2x, p3y, weaponDesc[1][pWeapon[1][1]],  font_get_size(font_weaponDesc)+2, _totalLength+font_get_size(font_weaponDesc));
}