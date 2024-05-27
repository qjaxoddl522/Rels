function scr_screenShake(v, power, time){
	with(obj_camera){
		shake = true;
		alarm[0] = time*game_get_speed(gamespeed_fps);
		pow = power;
		view = v;
	}
}