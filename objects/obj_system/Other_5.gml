/// @description 스크랩 계산
for(var i=0; i<2; ++i){
	earnScrap[i] += (room == room_11 or room == room_12) ? 100 : 0;
	earnScrap[i] += (room != room_11 and room != room_12) ? totalDamage[i]/2 : 0;
	earnScrap[i] += totalkill[i]*50;
	earnScrap[i] /= dead[i] ? 2 : 1;
	earnScrap[i] /= global.missionState = ms.fail ? 5 : 1;
	earnScrap[i] = floor(earnScrap[i]);
}