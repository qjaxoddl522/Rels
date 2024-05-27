/// @description 자가 회복 중
if pLowestHealth[player]+pRecoveryMax[player] > pHealth[player]{
	pHealth[player] = min(pHealth[player]+1, pMaxHealth[player]);
	alarm[3] = game_get_speed(gamespeed_fps);
}