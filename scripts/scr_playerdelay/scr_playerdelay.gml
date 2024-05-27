function scr_playerDelay(second){
	maxDelay = second;
	alarm[0] = game_get_speed(gamespeed_fps)*second;
}