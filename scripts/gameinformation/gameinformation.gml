/// @description 게임 시스템 정보 및 글로벌 변수 관리
#macro VIEW_W 480
#macro VIEW_H 320

#macro TILE_W 32
#macro TILE_H 32

enum delay {
	playerMove = 1.5,
	enemyMove = 2,
	ammo = 3
}

enum state {
	stray,
	move,
	setting,
	attack,
	special
}

//기본 설정 및 폰트 생성
window_set_size(960, 640);
randomise();
global.font_damage = font_add_sprite_ext(spr_font_damage, "0123456789Mis", true, 1);
global.font_price = font_add_sprite_ext(spr_font_price, "0123456789:", true, 1);

//조작키
globalvar pUp, pDown, pRight, pLeft, pButton1, pButton2;
pUp = [ord("W"), vk_up];
pDown = [ord("S"), vk_down];
pRight = [ord("D"), vk_right];
pLeft = [ord("A"), vk_left];
pButton1 = [ord("V"), ord("O")];
pButton2 = [ord("B"), ord("P")];

//스테이지 관련
global.availableStage = [1, 1]; //[chapter, stage]
global.chooseStage = [0, 0];
global.levelName = [
["기초 훈련", "심화 훈련", "첫 임무"],
["입구 정리", "진입"],
["정화"]];

//무기, 재화 관련
globalvar pWeapon, weaponSprite, weaponList, partsList, weaponStat, weaponUpgAtt, weaponDesc, weaponPrice, weaponUpg,scrap;
pWeapon = [[1, 0],[1, 0]]; //[무기, 보조무기]
weaponSprite = [spr_upgradeIcon, spr_PlazmaClassic26, spr_PortableBazooka, spr_MinChong];
weaponList = ["무기 강화","pc-26", "휴대용 바주카", "민총"];
weaponStat = [ //[피해량, 사거리, 탄창 크기(총알 개수), 후딜레이]
["-", "-", "-", "-"],
[24, 6, 5, 2],
[34, 3, 3, 3],
[26, 5, 4, 2]
]; 
weaponUpgAtt = ["-", weaponStat[1][0] div 10, weaponStat[2][0] div 10 , weaponStat[3][0] div 10]
weaponDesc = [[ //[무기, 보조무기]
"무기를 강화합니다. 모든 무기에 적용되며, 강화 횟수당 10%의 추가 공격력이 적용됩니다.",
"기본적인 플라즈마 방식의 자동소총입니다. 밸런스가 잘 맞아 누구나 사용하기 쉽습니다.",
"휴대용이라기엔 너무 크지만 표준 크기의 바주카보다는 작습니다. 그럼에도 범위와 화력은 여전합니다.",
"민트와 초콜릿이 결합된 탄을 발사하는 총입니다. 아군이 맞으면 약간의 체력을 회복합니다."
],[
"어떠한 파츠도 가져가지 않습니다. 고수를 상징합니다.",
"무기 명중률이 10% 증가합니다.",
"재장전 속도가 40% 빨라집니다."
]];
partsList = ["없음","조준경", "장전 부스터"];

for(var i=0; i<2; ++i){
	weaponPrice[i] = [[ //구입 시 드는 스크랩
	100,
	0,
	99999,
	99999
	],[
	0,
	500,
	500
	]]
	weaponUpg[i] = 0; //강화 상태
	scrap[i] = 0;
}