/// @description 플레이어 검사, 삭제
damId = instance_position(x, y, objPa_player);
if damId != noone and alarm[0] == -1{
	scr_playerDamage(damId, damage);
	alarm[0] = game_get_speed(gamespeed_fps);
}

image_alpha -= alpha;
if image_alpha<=0
	instance_destroy();