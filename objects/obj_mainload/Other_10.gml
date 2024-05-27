/// @description 버튼 동작
if file_exists("save")
	game_load("save");
else
	show_message_async("세이브 파일이 존재하지 않습니다.")