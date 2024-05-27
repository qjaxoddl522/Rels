/// @description 초기설정
depth = -1;
player = player; //플레이어 번호(플레이어 오브젝트에서 정의)

//상태 관련
isReady = true; //행동할 준비가 됐는지
isMoving = false; //이동하는 중
isAttacking = false; //공격하는 중
isReloading = false; //재장전하는 중
aimId = noone; //조준 중인 적 id
maxDelay = 0; //후딜레이 최대치(쿨타임 드로우 용도)
behavior = 0; //마지막에 한 행동(아이콘 표시)

//path 관련
path = path_add();
path_real = path_duplicate(path); //이동거리 초과를 고려한 진짜 path
pathReady = false;
drawing = 1;

//커서 관련
cursor = undefined;
cursorReady = false;
cursorScroll = false; //커서가 연속적 이동을 하는 중인지
cursorScrollDelay = 0; //연속적 이동 제한
cursorOnEntity = true;
pressedKey = 0; //어떤 키를 누르고 있는지

//공격 관련
cursorIndex = 0; //조준 커서 이미지 인덱스(애니메이션 용도)
hitRate = noone; //명중률
//공격 애니메이션 관련
weaponX = x;//무기 드로우 좌표
weaponY = y;
weaponDir = 0;
weaponImg = 0;
shotX = 0; //반동 x좌표
shotRot = 0; //반동 기울어짐

//탄창 관련
ammo = weaponStat[pWeapon[player][0]][2];
ammoMax = ammo;
reloadTimer = 0; //꾹 누르면 수동 재장전하기 위한 변수

dir = 0; //플레이어의 커서 방향