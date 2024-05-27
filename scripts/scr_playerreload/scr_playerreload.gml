function scr_playerReload(){
	behavior = 2;
	isReady = false;
	isReloading = true;
	alarm[2] = (delay.ammo-1)*game_get_speed(gamespeed_fps)*(weaponPrice[player][1][2] == 0 ? 0.4 : 1);
	audio_play_sound(snd_reload, 0, false);
}