/// @description 버튼 동작
if !file_exists("save"){
	room_goto_next();
}else if show_question("기존 세이브 파일이 사라집니다. 계속하시겠습니까?"){
	room_goto_next();
}