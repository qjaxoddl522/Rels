/// @description ++text_draw
if text_draw<5{
	++text_draw;
	audio_play_sound(snd_resultBeep, 0, false);
	alarm[0] = 0.5*game_get_speed(gamespeed_fps);
}else{
	scrap_draw = true;
}