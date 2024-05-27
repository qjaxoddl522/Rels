/// @description 체력 깎기
scr_playerDamage(players[0], 30);
scr_playerDamage(players[1], 30);

//뷰 이동
for(var i=0; i<array_length(players); ++i){
	aimPositionX[i] = players[i].x;
	aimPositionY[i] = players[i].y;
	viewX[i] = aimPositionX[i];
	viewY[i] = aimPositionY[i];
}