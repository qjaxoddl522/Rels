/// @description 변수 선언, 시스템 생성
enum ms{
	start,
	playing,
	pause,
	fail,
	clear
}

//플레이어 능력치 관련
globalvar pMaxHealth, pHealth, pLowestHealth, pRecoveryCooldown, pRecoveryMax, pSightRange, pMoveDis;
for(var i=0; i<2; ++i){
	pMaxHealth[i] = 100;
	pHealth[i] = pMaxHealth[i];
	
	pLowestHealth[i] = pMaxHealth[i];
	pRecoveryCooldown[i] = 5;
	pRecoveryMax[i] = 10; //최저체력+값만큼 최대회복

	pSightRange[i] = 8;
	pMoveDis[i] = 5;
}

globalvar map_w, map_h, players, ui_h;
map_w = floor(room_width/TILE_W);
map_h = floor(room_height/TILE_H);
players[0] = obj_player1;
players[1] = obj_player2;
ui_h = 16;

instance_create_layer(0, 0, "System", obj_gridMap);
instance_create_layer(0, 0, "System", obj_camera);
instance_create_layer(0, 0, "System", obj_sysUI);
instance_create_layer(0, 0, "System", asset_get_index("obj_missionManager"+string_copy(room_get_name(room), 6, 7)));

globalvar totalDamage, totalkill, dead, earnScrap;
totalDamage[0] = 0;
totalDamage[1] = 0;
totalkill[0] = 0;
totalkill[1] = 0;
dead[0] = false;
dead[1] = false;
earnScrap[0] = 0;
earnScrap[1] = 0;

//그림자
shadowSurface = surface_create(room_width, room_height);
skewX = 5;
shadowHeight = 20;