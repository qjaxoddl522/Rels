/// @description 관리
var keyCheck = keyboard_check_released(pButton1[0]) or keyboard_check_released(pButton1[1]);
visible = !inEvent;

alpha = min(1, alpha+.04);
xscale = alpha==1 ? min(1, xscale+.04) : xscale;

if xscale == 1 and (keyCheck or first) and !inEvent{//다음 대화
	if alarm[0] == -1{
		if !ds_queue_empty(line_queue){
			dequeue(line_queue);
		}else{
			instance_destroy();
		}
		first = false;
	}else{
		text_count = string_length(text);
		text_copy = text;
	}
}

if inEvent and timeline_position > timeline_max_moment(timeline_index){
	if !ds_queue_empty(line_queue){
		dequeue(line_queue);
	}else{
		instance_destroy();
	}
	inEvent = false;
}