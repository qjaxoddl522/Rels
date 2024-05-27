/// @description 텍스트 갱신
if text_count < string_length(text){ //텍스트 출력
	++text_count;
	var char = string_char_at(text, text_count);
	text_copy += char;
	if char != " "{//소리 틀기
		audio_play_sound(snd_dialog, 10, false);
	}
	alarm[0] = .05*game_get_speed(gamespeed_fps);
}