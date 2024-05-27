game_save("save");
if !audio_is_playing(snd_intro){
	audio_stop_all();
	audio_play_sound(snd_intro, 0, true);
}