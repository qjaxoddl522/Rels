/// @description 
if mouse_check_button_pressed(mb_left) && position_meeting(mouse_x,mouse_y,id){
	_pressed = true;
}

if mouse_check_button_released(mb_left) && _pressed == true{
	_pressed = false;
	if position_meeting(mouse_x,mouse_y,id){
		event_user(0);
	}
}
image_index = _pressed?1:0;