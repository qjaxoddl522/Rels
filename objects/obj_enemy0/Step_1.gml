/// @description 풀피 확인
if full and hp_max > hp{
	alarm[1] = game_get_speed(gamespeed_fps);
	full = false;
}
event_inherited();