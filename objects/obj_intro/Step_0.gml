/// @description 진행
if keyboard_check_released(pButton1[0]) or keyboard_check_released(pButton1[1]){
	if scene<array_length(dialogue)-1{
		++scene;
	}
	else{
		room_goto(room_mission);
	}
}